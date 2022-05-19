Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CEE652D397
	for <lists+linux-gpio@lfdr.de>; Thu, 19 May 2022 15:08:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238346AbiESNIP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 May 2022 09:08:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238431AbiESNIN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 May 2022 09:08:13 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E45BABDA04
        for <linux-gpio@vger.kernel.org>; Thu, 19 May 2022 06:08:11 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-2f83983782fso56059667b3.6
        for <linux-gpio@vger.kernel.org>; Thu, 19 May 2022 06:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=La/7OOALhauUEG5Ji2oO8YvO8VOzXhhzoK6CQFuGens=;
        b=Mc01J4Jmev0FOw6h6XJqZkIQNwLAXIZdmviiHFc4dS0SXngMNt4uVOaGj3sQE+/AjG
         iHVJtLxz0SRFtzC6KZYGso767mBxZ0YMoWEKrI7sHpnTFU1GKZB5x4FT+6l2iD4pSFEU
         TK/IfXww27HTOb/Kd3t2LMc2606sodqY9RPc2jYCO39lTbk2OoWLDBBks1MollfDd9JR
         6CDvrRNyslLM/+JKHLfknToZJXU87WXzxjUn8DFRZxC2orM1AQSKre+uvW2SO+Y/mspm
         Q7lV5BmKPsaiawxHFXDNhHZiDGHjki0iHzM1FgKHhRjoSO660JbHtVqDs/JDdIbLySAR
         Ho0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=La/7OOALhauUEG5Ji2oO8YvO8VOzXhhzoK6CQFuGens=;
        b=RGBBfgPNf2OR/0RKQrCot9neUcy1h8Z47AA3W1z0vDYF4XfKN2veL52pG/Ui5SiNCa
         kg9bSkZAjL7O/qWPnn0UxfExAW0HEfM+iUU0UujnkVkTT1KL07QSNiXfoGYuxoN4/QXF
         nTKDCr7Eb7N+oFj6bXXmQEUL+2o7VAB7QTET/F+3sXEPfVzU/u/WXQMRCCdjoGB2w3XZ
         61Qu8ynOeaeSRnsGJd4wyhv2Z9sA40+0+5UbDiBBl/YxYGZubVkBV1v2xut8KcJCdXH0
         ZvOeGduyGcO89CRonL8Bnun808u6igxmxbCp6/M0C+9tLjdF+/GHT95gpYMvAcs12oXz
         Lalg==
X-Gm-Message-State: AOAM530yF66u9t5wdg5XF5paNxyjlbM4AV/DqMqdbZLJVGuJrgimuvtI
        OSrBdL9mv1czAylioxJkWL6BuWZnwE77V2yjSWIIOA==
X-Google-Smtp-Source: ABdhPJzjXaM6yDiZGQ6JFS2PFd8kAqU9kyb5veZ5kmD7lX3tGNCp8MwcAxKVbfGmkiMRw+pGuRJzDHAhcSYdhHAWbZg=
X-Received: by 2002:a0d:f0c3:0:b0:2f4:d291:9dde with SMTP id
 z186-20020a0df0c3000000b002f4d2919ddemr4419526ywe.437.1652965691192; Thu, 19
 May 2022 06:08:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220517032802.451743-1-Mr.Bossman075@gmail.com> <20220517032802.451743-11-Mr.Bossman075@gmail.com>
In-Reply-To: <20220517032802.451743-11-Mr.Bossman075@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 19 May 2022 15:08:00 +0200
Message-ID: <CACRpkdbjLiF=ZU1tjPQ+=eKd24aEOi+tZ4wZYamuKyC0B=DisA@mail.gmail.com>
Subject: Re: [PATCH v3 12/15] pinctrl: freescale: Add i.MXRT1170 pinctrl
 driver support
To:     Jesse Taube <mr.bossman075@gmail.com>
Cc:     linux-imx@nxp.com, robh+dt@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, aisheng.dong@nxp.com,
        stefan@agner.ch, daniel.lezcano@linaro.org, tglx@linutronix.de,
        arnd@arndb.de, olof@lixom.net, soc@kernel.org,
        linux@armlinux.org.uk, abel.vesa@nxp.com, dev@lynxeye.de,
        marcel.ziswiler@toradex.com, tharvey@gateworks.com,
        leoyang.li@nxp.com, sebastian.reichel@collabora.com,
        cniedermaier@dh-electronics.com, clin@suse.com,
        giulio.benetti@benettiengineering.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 17, 2022 at 5:28 AM Jesse Taube <mr.bossman075@gmail.com> wrote:

> Add the pinctrl driver support for i.MXRT1170.
>
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
> V1 -> V2:
>  - Nothing done
> V2 -> V3:
>  - Nothing done

This patch applied to the pinctrl tree.

Yours,
Linus Walleij
