Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC19B622581
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Nov 2022 09:32:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230058AbiKIIcL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Nov 2022 03:32:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230208AbiKIIb5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Nov 2022 03:31:57 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B7CA1EC6C
        for <linux-gpio@vger.kernel.org>; Wed,  9 Nov 2022 00:30:16 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id v17so26105367edc.8
        for <linux-gpio@vger.kernel.org>; Wed, 09 Nov 2022 00:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/KEosSqcp4BPkxkVKDaVPG2cOg3OrufQrszZfeTNLmc=;
        b=zZmIPn5inLCawgf28H3rXNu/bzYowjBolfcRIChBPh/LhhzHeu+kFXZPCF0kcT7RSl
         wxLJA4npAvs3vEkaiGN8QFRtF3821XH16aWQ+zh7hivDJwrTEODFxEesXuv/p/9C0NmQ
         U0LHjfvxr8RHSrnGmC7MScFJp7cQ59BsVZ+zhqBFSzz0dAyBt4yoM3dToLoMTTFTtUPc
         BzjmkvL1qnx7RJAOt3kOuw838pvjOQYVYvEWAUffecoH6sH8VBVWBWTe8tY1g8nAuw6i
         r7rvsoweIabQCnTrGWDiONdBXbCSrR2HMpPdb2ko5QrP+YJQkwgJLkoGHlyxDxyZh/aO
         CwZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/KEosSqcp4BPkxkVKDaVPG2cOg3OrufQrszZfeTNLmc=;
        b=z8AbOuN2IfxZD86HvjnmGeIH2lQc1m4F1i/XtE4KTeWe7feiZTmQeLq6PKQbatqngm
         Eq4pXlN2uvDjSubVo43tmnH4n2geYpor21XLGNfxBmxqR2US5REFrEeB9zzoS7ccw/UM
         2H+ndzvZZURAkR8fMUhilplmUebEAlB2LNHnULd1upVEuhKbQd90y7qIbAF+AWa9Uy9d
         DCOvIHj1nOnnOBfsPjEEgzzUzXz0eHUpurVlVNQc8/JKhgSOQH8TdXM+IJdJKXxzEkec
         WZFJJICOMTsUI6Kt5qMl1DibvK3AFo20q/G28nouHiZXsaANv9rzSp2SLJ88O7EMKLtK
         Xx5Q==
X-Gm-Message-State: ACrzQf3gLy6MgH//VMXjFMhKSHRyd20VL/mLXyIG4Ydv494LfrS0lKoq
        n62Z363uYImKKd7NYSN2S5vU6K2RZa5lP3eiZxPljVTLWeI=
X-Google-Smtp-Source: AMsMyM7IN2FtSuX/WH4eODp1gpontwnXe64B3dbs+WawXshFYIcrLqgexXQyR2mZRH85H6+17W9sVEW+IlYHRt0xAD0=
X-Received: by 2002:a05:6402:d0b:b0:458:a244:4e99 with SMTP id
 eb11-20020a0564020d0b00b00458a2444e99mr59294762edb.46.1667982615144; Wed, 09
 Nov 2022 00:30:15 -0800 (PST)
MIME-Version: 1.0
References: <20221109061122.786-1-zhuyinbo@loongson.cn> <fc52c692-4cbd-e5f9-2e62-d05b5330052a@loongson.cn>
In-Reply-To: <fc52c692-4cbd-e5f9-2e62-d05b5330052a@loongson.cn>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 9 Nov 2022 09:30:03 +0100
Message-ID: <CACRpkdbu-gqNBK0=L8pOr2TwYGOv2MUvFxzYiBNfJ5KyJT+A8g@mail.gmail.com>
Subject: Re: [PATCH v8 1/2] pinctrl: pinctrl-loongson2: add pinctrl driver support
To:     Yinbo Zhu <zhuyinbo@loongson.cn>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        zhanghongchen <zhanghongchen@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 9, 2022 at 7:42 AM Yinbo Zhu <zhuyinbo@loongson.cn> wrote:

> I had added some changes in these series patch in v8, please help add my
> change and merge it into your tree and sync it to linux-next.

Yeah no problem, I took out the v7 version and applied this one instead.

Yours,
Linus Walleij
