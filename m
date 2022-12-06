Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62B1D6445AC
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Dec 2022 15:31:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233602AbiLFObZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Dec 2022 09:31:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230230AbiLFObY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Dec 2022 09:31:24 -0500
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37B1A38B8
        for <linux-gpio@vger.kernel.org>; Tue,  6 Dec 2022 06:31:24 -0800 (PST)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-3bfd998fa53so153633257b3.5
        for <linux-gpio@vger.kernel.org>; Tue, 06 Dec 2022 06:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mlOY/JG11Kb2vYt9wP3LqvGw3PxjP3m1Vq5ENgIneHY=;
        b=TJKkM5D7b/fRFePYoW3kYWQ7GjIeZXOYfAjuP6mp1h5wMgBWuaYFHV+q8OLyTxx7e4
         vm9QItm/T4GXHE54+tN0AFOuC+6hCAJgN+OOLZ9GoUf7fAYAGh8A1vHojdFeaIa6UjCZ
         HIaxFBr1RDnT5WcH3dmDYg8QRREr021ZJs3z5OwruggKIE8WZ9VGV8e1HzsSZEydLKEj
         MfRKc7kYD+nKSe3B7bgldYDpNe2s6iKePfPUZC5IOpyegd9kMY8F80ZxBq0Py1oxV7tX
         mm8KhL0CWkmZTCu9t3vdO78cyRXPmQxIfwI3FnFc+BYd9k9HKMIjBWwbvHB7EsiHxpxp
         Kqcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mlOY/JG11Kb2vYt9wP3LqvGw3PxjP3m1Vq5ENgIneHY=;
        b=A4hiZe6BRC/L96j/KkD8zMOityZiDoYmxdt2ANuj+r/6AR4h0BpW9ugutp3Px34KPn
         rmnzwpzmRC/Yz6k1nSgQNBaDZeh8suHjPND4aL/wWKOW3GQS7dxJG3Y0Rc4AUNJ6GKMc
         8gKCShymSvEBuGpwlpmA/WxV6iNgJA5iMiLKiHXj2LGS7SULJ2KT6zhdWBBSgsX0pCNn
         +ReMpc6KVhWPwVrrudGiuXRv5xBII1T6GtG6pInHQrn3dOLJDVlZXgm0svfRS3X78cdU
         BmP4YNejMGLX2n5kKvNPDdIGr6juTJKZ1YTa2h34Fy/n+u4H9PJE4vkWEGvoLHAV5AQA
         kMCg==
X-Gm-Message-State: ANoB5pkJlFNBtgPoxd5YWgmVngcI5zIbgOMUyBuFHczr+pgnmJ5RzHly
        BqZI3gXuXRAGeXTGqJ7ZT32hb/vC/lbRnnsC4mgtZg==
X-Google-Smtp-Source: AA0mqf7kzBI421PquAh70I3OojmBcRL4qM9n8a6LcSKgTXvGJuBVdvsMzLqvpkVOQU9KSOOCOdgQfVBpIVJSY7dnv7o=
X-Received: by 2002:a0d:e645:0:b0:3bb:6406:3df1 with SMTP id
 p66-20020a0de645000000b003bb64063df1mr47658417ywe.319.1670337083465; Tue, 06
 Dec 2022 06:31:23 -0800 (PST)
MIME-Version: 1.0
References: <20221129120126.1567338-1-cuigaosheng1@huawei.com> <DM5PR11MB1499491D6679FA47FFA3FE5FC4129@DM5PR11MB1499.namprd11.prod.outlook.com>
In-Reply-To: <DM5PR11MB1499491D6679FA47FFA3FE5FC4129@DM5PR11MB1499.namprd11.prod.outlook.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 6 Dec 2022 15:31:12 +0100
Message-ID: <CACRpkdaYP0ZW5PrQyOk0=Sop9mXkvxjFP3-r_2YdoyJoVeqz9w@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: thunderbay: fix possible memory leak in thunderbay_build_functions()
To:     "D, Lakshmi Sowjanya" <lakshmi.sowjanya.d@intel.com>
Cc:     Gaosheng Cui <cuigaosheng1@huawei.com>,
        "S, Kiran Kumar1" <kiran.kumar1.s@intel.com>,
        "rafal@milecki.pl" <rafal@milecki.pl>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "N, Pandith" <pandith.n@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 29, 2022 at 1:09 PM D, Lakshmi Sowjanya
<lakshmi.sowjanya.d@intel.com> wrote:

> Thanks for the changes suggested, but pinctrl-thunderbay.c file will soon be removed from opensource kernel

Why? Is the product cancelled?

Yours,
Linus Walleij
