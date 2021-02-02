Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BF0430BD44
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Feb 2021 12:39:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230033AbhBBLgV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Feb 2021 06:36:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:59592 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230248AbhBBLfI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 2 Feb 2021 06:35:08 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id CC32464E9B;
        Tue,  2 Feb 2021 11:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612265666;
        bh=iQZjdrytDnYe4+JE2zLjRm1WSmA5jVNSNUrdiPWQqaA=;
        h=Date:From:To:Cc:Subject:From;
        b=eA1YvFBH617s0j/ZHp9BrVaGBQse3Roq/akpIFgO8h4YK7KAtGXqfn+8F30qXEGn7
         P3fVr3ENGAQ4m9QgKtpkUPG4jrbeBxRwk7RTtuxPmir9B4L60SU088ooeP6orMQHDu
         Spuos6n/rMOJ8jJtTVDIgcik1eTfAqlgK9b0v8LRuK6tRytdQ4aUfUVyJ+18iaAhoh
         FGJe5MlorJAi0JzgkEjW89Rh17W/sNrttGvuWEjyOLa8x+94QTjk8A/f3kJhKLkBt2
         R3ftH5ewKRfAoHATLdIPutAS0p0/+FYXfweTB/hYQNJvVly/Qpi0aaRKGr5gaxG5zN
         PN6NIwhGI3Lbw==
Date:   Tue, 2 Feb 2021 05:34:23 -0600
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        UNGLinuxDriver@microchip.com,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: [REPORT][next] pinctrl: pinctrl-microchip-sgpio: out-of-bounds bug
 in sgpio_clrsetbits()
Message-ID: <20210202113423.GA277746@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

While addressing some out-of-bounds warnings, I found the following bug:

drivers/pinctrl/pinctrl-microchip-sgpio.c:154:57: warning: array subscript 10 is above array bounds of ‘const u8[10]’ {aka ‘const unsigned char[10]’} [-Warray-bounds]

The bug was introduced by commit be2dc859abd4 ("pinctrl: pinctrl-microchip-sgpio: Add irq support (for sparx5)"):

575         sgpio_clrsetbits(bank->priv, REG_INT_TRIGGER + SGPIO_MAX_BITS, addr.bit,
576                          BIT(addr.port), (!!(type & 0x2)) << addr.port);

REG_INT_TRIGGER + SGPIO_MAX_BITS turns out to be 10, which is outside the boundaries
of priv->properties->regoff[] at line 154:

151 static inline void sgpio_clrsetbits(struct sgpio_priv *priv,                                        
152                                     u32 rno, u32 off, u32 clear, u32 set)                           
153 {                                                                                                   
154         u32 __iomem *reg = &priv->regs[priv->properties->regoff[rno] + off];                        
155         u32 val = readl(reg);                                                                       
156                                                                                                     
157         val &= ~clear;                                                                              
158         val |= set;                                                                                 
159                                                                                                     
160         writel(val, reg);                                                                           
161 }

because priv->properties->regoff[] is an array of MAXREG elements, with MAXREG
representing the value of 10 in the following enum:

 28 enum {                                                                                              
 29         REG_INPUT_DATA,                                                                             
 30         REG_PORT_CONFIG,                                                                            
 31         REG_PORT_ENABLE,                                                                            
 32         REG_SIO_CONFIG,                                                                             
 33         REG_SIO_CLOCK,                                                                              
 34         REG_INT_POLARITY,                                                                           
 35         REG_INT_TRIGGER,                                                                            
 36         REG_INT_ACK,                                                                                
 37         REG_INT_ENABLE,                                                                             
 38         REG_INT_IDENT,                                                                              
 39         MAXREG                                                                                      
 40 };

 52 struct sgpio_properties {                                                                           
 53         int arch;                                                                                   
 54         int flags;                                                                                  
 55         u8 regoff[MAXREG];                                                                          
 56 };

Thanks
--
Gustavo
