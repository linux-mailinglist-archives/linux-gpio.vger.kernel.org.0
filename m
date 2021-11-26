Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CEEF45F319
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Nov 2021 18:41:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231341AbhKZRox (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Nov 2021 12:44:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231638AbhKZRmx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Nov 2021 12:42:53 -0500
Received: from nbd.name (nbd.name [IPv6:2a01:4f8:221:3d45::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D3F5C0619D3;
        Fri, 26 Nov 2021 09:19:23 -0800 (PST)
Received: from [2a04:4540:1400:cf00:853a:6162:5f49:5bef]
        by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <john@phrozen.org>)
        id 1mqesV-0007LY-4v; Fri, 26 Nov 2021 18:19:15 +0100
Message-ID: <fe218610-660c-929b-39f3-5146b2fe9aad@phrozen.org>
Date:   Fri, 26 Nov 2021 18:19:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [PATCH v4 12/12] gpio: Add support for Airoha EN7523 GPIO
 controller
Content-Language: en-GB
To:     Felix Fietkau <nbd@nbd.name>, linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20211125110738.41028-1-nbd@nbd.name>
 <20211125110738.41028-13-nbd@nbd.name>
From:   John Crispin <john@phrozen.org>
In-Reply-To: <20211125110738.41028-13-nbd@nbd.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 25.11.21 12:07, Felix Fietkau wrote:
> + * @dir1: The direction register for the lower 16 pins.

s/lower/higher/

just spotted that one aswell

	John

