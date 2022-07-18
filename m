Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D849577EDA
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Jul 2022 11:42:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234192AbiGRJm5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Jul 2022 05:42:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233921AbiGRJm5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Jul 2022 05:42:57 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84B2E1A83F
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jul 2022 02:42:56 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id 75so19816981ybf.4
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jul 2022 02:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kaTdpzL/09NSJ4TUIFfgyLGReshLNgXnL17skBWex4Y=;
        b=HLHCvcSLv+24qkLc2rrQx3oIt4jZ5CmUGCOc/KykdDzpzPmJk4pR7qEw3cJgseS6c5
         FcvNcJR6MjF5IcpRNJ/GcNfWC0zJrclUTFeAOTsKHH33zWQ3jkob1L4vhz6entFu7b9E
         /TpsEf4F0ZEmNAhMH1NW54kPDtIBXrsAgVXR1RhmeNjUZvUVIlrzMElS/rcS1QljbKYz
         TzuPJWmonSzxyRsiGnBqhiMVsCnw18A67AsMAeVkh6iGMLf52d6DytbjmEM0uze2H8no
         GmxHffjotK3FwvV+wMMfz+hrA+lc1etVLR/d/WwCdyfW0r1AiSMQH53xNCFZuoP72G7s
         lF0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kaTdpzL/09NSJ4TUIFfgyLGReshLNgXnL17skBWex4Y=;
        b=KVZYNsgp1dYTO0LTa7RTT9+niY+SzsSOTNWUMaA6uWN7xQRRuxtOkiYUfQYiPkDAmV
         FuW81tVilWvL6d/RSoB9XiJtkDD/ZO3b0s+n6tequVN7O/HXN0dfP/F6g+CIu7Rj7/Ew
         Dw0O5EwpCrOx7PdZTQyH+vvxd2DSeoihqwvAcpPxU1v8v2+JyzK4EDWIJrIe7kvmbEcn
         MFurIcK5Zl3WEe5Q8paFmpRWr506e+W/mmOjuOepBva0gSUeS/3egdstSYn8qm1GQL6D
         SunpFtTvQ8WY0YViXd5i9H5urEK1ehyW4IyrIlG7POcBbb8AKxfgVpoNcyZ1lYZpTxf+
         U2lw==
X-Gm-Message-State: AJIora/fmCg4At79QaCuqh2eHCdUnkADaI3Dp32k6/XJwrid+O8x8hNj
        SNcXZc26wXSbrCY4XYDo62FvJFw8MqlFO7EgIna+Gg==
X-Google-Smtp-Source: AGRyM1tgIBXlqvLOdfiPM6+4drRtrrNpd3G6iSvyBGxWGTSRgY/DuBPmcIBrwcldmVvjxsXTGZM7rE0oEAWOWt66Eck=
X-Received: by 2002:a5b:9c5:0:b0:66e:cbbf:2904 with SMTP id
 y5-20020a5b09c5000000b0066ecbbf2904mr24713801ybq.220.1658137375821; Mon, 18
 Jul 2022 02:42:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220712115154.2348971-1-festevam@denx.de>
In-Reply-To: <20220712115154.2348971-1-festevam@denx.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 18 Jul 2022 11:42:44 +0200
Message-ID: <CACRpkda5S=DmPQfH5V6bmZngztJ7_aYdpxZ0o0g-63Ufa_PtDg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: imx93: Add MODULE_DEVICE_TABLE()
To:     Fabio Estevam <festevam@denx.de>
Cc:     ping.bai@nxp.com, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 12, 2022 at 1:52 PM Fabio Estevam <festevam@denx.de> wrote:

> Pass MODULE_DEVICE_TABLE() so that module autoloading can work.
>
> This also aligns with the other i.MX8 pinctrl drivers.
>
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Patch applied!

Yours,
Linus Walleij
