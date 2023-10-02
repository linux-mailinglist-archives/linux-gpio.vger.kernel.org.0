Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 551A07B4D44
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Oct 2023 10:25:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235848AbjJBIZx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Oct 2023 04:25:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235845AbjJBIZs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Oct 2023 04:25:48 -0400
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07874C4;
        Mon,  2 Oct 2023 01:25:44 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D9DEF60017;
        Mon,  2 Oct 2023 08:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1696235143;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RNHnqB4N/sFo3MdfMP59guhAXP0/erOIPWf4ZjX7S+0=;
        b=OxUfIdUzPTlw3wqOKKfq69BnqhdnPbSQ2ry+WhusFq3EvqOfEiv9SvObfv01HSUlisG2xV
        nOPOAcvS6H5hs3FTjVttLncRwMaMqMlOkRNQq0rApnC2DqftwN/wCG3Cl8Y7MTlc1N+1J2
        hNTGbDHBTvqppsJ+n0DNE2qeqtEUGFSagsB2KFJBXCIsnVSk2ylCBJgekoWW2Z4PYzbpAT
        Ov/wWE4EgfH5y+S9mivlHT76rX2s8DpNzgeUkaQbP05GbKuto4/rcFxlgG87fMwfQJwRkM
        IJdzRoENhqSmQO+g3XTOoz8wSuzryOni23wnAxV1PRNeHZkQDxxqMcqsqEeYBg==
Date:   Mon, 2 Oct 2023 10:25:41 +0200
From:   Luca Ceresoli <luca.ceresoli@bootlin.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] pinctrl: tegra: Display pin function in pinconf-groups
Message-ID: <20231002102541.426371e8@booty>
In-Reply-To: <20230929122101.466266-1-thierry.reding@gmail.com>
References: <20230929122101.466266-1-thierry.reding@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Thierry,

On Fri, 29 Sep 2023 14:21:01 +0200
Thierry Reding <thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
> 
> The function that a pin is muxed to can be read from the top-level
> pinctrl-maps debugfs file. However, this only reflects the values that
> were specified in device tree, so they will only show deviations from
> the hardware default setting. Display the current pinmux setting in the
> per-controller pinconf-groups debugfs file along with the rest of the
> per-pin configuration settings.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>

[On Tegra20]
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
