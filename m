Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EE9A223BAE
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 14:49:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726830AbgGQMtF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jul 2020 08:49:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:50408 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726648AbgGQMs7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Jul 2020 08:48:59 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DCB1420775;
        Fri, 17 Jul 2020 12:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594990139;
        bh=aANPTIRcBlwNxZ39CkeKsSIiggpR6aP1LDoZat8EUlY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=f68uB8Ol5d98bA44WDOoe9Y1fGkNoWEC+amMvpziY3HoXmtAbi9CwZbCc57LrSBZ1
         BNvJBPK/oKfdZgg6LrCPVKfj0Yd4Uf2tTu+3qGZtVnwfUrbmwJtemLJMGqsqdxsaPz
         +SHx1BZQ5mMJL0bvIRdXJWagQJ85fmckQXCY6ETc=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=wait-a-minute.lan)
        by disco-boy.misterjones.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1jwPnN-00Ccsm-DC; Fri, 17 Jul 2020 13:48:57 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Alexandre Torgue <alexandre.torgue@st.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     linux-kernel@vger.kernel.org, marex@denx.de,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH v3 0/8] irqchip: Fix some issues and do some code cleanups about Loongson
Date:   Fri, 17 Jul 2020 13:48:48 +0100
Message-Id: <159499001592.546505.6228869407705026120.b4-ty@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <1594087972-21715-1-git-send-email-yangtiezhu@loongson.cn>
References: <1594087972-21715-1-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: alexandre.torgue@st.com, jason@lakedaemon.net, tglx@linutronix.de, yangtiezhu@loongson.cn, linux-kernel@vger.kernel.org, marex@denx.de, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, jiaxun.yang@flygoat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 7 Jul 2020 10:12:44 +0800, Tiezhu Yang wrote:
> Check the return value of irq_domain_translate_onecell() and
> irq_domain_translate_twocell(), fix potential resource leak
> and dead lock, do some code cleanups about Loongson to make
> it more clean and readable.
> 
> v2:
>   - In order to avoid git send-email failed, make the related patches
>     about Loongson into a new patch series and add "Fixes" tag
> v3:
>   - Add a new patch "irqchip/loongson-liointc: Fix potential dead lock"
>   - Fix another typo in loongson,liointc.yaml
> 
> [...]

Applied to irq/irqchip-5.9, thanks!

[1/8] irqchip/loongson-htpic: Remove redundant kfree operation
      commit: f90fafecf4880b9785da85feb9b3e6d85fbf2287
[2/8] irqchip/loongson-htpic: Remove unneeded select of I8259
      commit: 85efd6059ae1a99e5e7205f37e910fd41dfa0ade
[3/8] irqchip/loongson-htvec: Fix potential resource leak
      commit: 652d54e77a438cf38a5731d8f9983c81e72dc429
[4/8] irqchip/loongson-htvec: Check return value of irq_domain_translate_onecell()
      commit: dbec37048d27cee36e103e113b5f9b1852bfe997
[5/8] irqchip/loongson-pch-pic: Check return value of irq_domain_translate_twocell()
      commit: 66a535c495f72e1deacc37dfa34acca2a06e3578
[6/8] irqchip/loongson-pch-msi: Remove unneeded variable
      commit: b10cbca8f03dd10dc241395a639d488f4144e986
[7/8] irqchip/loongson-liointc: Fix potential dead lock
      commit: fa03587cad9bd32aa552377de4f05c50181a35a8
[8/8] dt-bindings: interrupt-controller: Fix typos in loongson,liointc.yaml
      commit: 1055df97676a31df0b46942cb8bf66eb37ae318f

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.


