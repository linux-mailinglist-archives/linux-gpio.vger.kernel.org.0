Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAE197B3209
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Sep 2023 14:07:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233188AbjI2MHB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Sep 2023 08:07:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233038AbjI2MG7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Sep 2023 08:06:59 -0400
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74A571AC
        for <linux-gpio@vger.kernel.org>; Fri, 29 Sep 2023 05:06:57 -0700 (PDT)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-59c0b9ad491so172855007b3.1
        for <linux-gpio@vger.kernel.org>; Fri, 29 Sep 2023 05:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695989216; x=1696594016; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6k8d+wOpDtzxYwfVwEbfhHwnOfzBlSRgqZm5x6PxClw=;
        b=rRH/I2zEwQIWBh0JBlrrgeE8NmWv2f9dvqvIH1nuRkpYmWWhG4kLQIbfLnhS9tfQ+R
         uo1eEv4jk9Xbyy+1k8YAiZfIx172TTo+gCHsPVa6jDtq040HNyQNYTY2MqApD9EEraTJ
         MxdPBxmFqwRlEG+57aI/lohJFtKdt57tfeMzP7LMybp+8xA6UxyhTjvNDtn+cs0+hkZ0
         bjy8l3ZXauxvu0KJqkvOv5oWdCyqu+5tfkrtLVMvE/vqElFWExz5e4MGnaLXCaJfvEFq
         PWT905J7za7Ja6hZVDI+pTNdMfEY5RRqeop1qe8MLNxFlWbWunnet/4AoYB/tyV55/iY
         SpbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695989216; x=1696594016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6k8d+wOpDtzxYwfVwEbfhHwnOfzBlSRgqZm5x6PxClw=;
        b=RHR/K1N6tbD3GbNT7ozgHG9f3IPB+YFWBmHlkBk5S9TzWMGJwy/6q0xabOzpVs1Cji
         38xzv/W8GrMTvPtdQmaJqAQoVW4TZDMASmIhvaBUtQI4VlLycqOrP8gh4ApHGOQdv8UM
         8Byux+H2t9aONdazhjRfVpBV4tq5hp/ubCH0SZxmTxJU1SoMBBFA7aCexcgmJd16Nosr
         PjlLM9C0ESUyK7WrjdLb59fG58ygcFLad2f1y3Q7YjsUfZgxXh16z1hrco7qO8xVQnBm
         UYoPX4cCEbUIuSLuT2fJxmoBt55WfDjtKP+1G6Dpq5SwhInO/QBKDt4potVg2GaU6DVL
         RavA==
X-Gm-Message-State: AOJu0YylD4/pQx5QUN2rinOpmUoRo22+CWLRq2pyuF8HyOpOOwtSxwT4
        8H3youzzRQx+ndTTh5R3DjEV1Y+NvUaoHT4GaGXU2g==
X-Google-Smtp-Source: AGHT+IFRqUNs+5+Kc6FjsUJV/KQAZ3azq5zaAnYj6Fq2e61HxjwzffG0QGDNQkBCK/b8ZNGANF6Rd8YACfZHAEgh7bo=
X-Received: by 2002:a81:834c:0:b0:59b:d872:5ca8 with SMTP id
 t73-20020a81834c000000b0059bd8725ca8mr4011443ywf.22.1695989216453; Fri, 29
 Sep 2023 05:06:56 -0700 (PDT)
MIME-Version: 1.0
References: <202309291530.qDP0N7ET-lkp@intel.com>
In-Reply-To: <202309291530.qDP0N7ET-lkp@intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 29 Sep 2023 14:06:44 +0200
Message-ID: <CACRpkda4SYP5twcxDGA_k4VzV0mh1Q190SZT0u7xqZykrPt=VA@mail.gmail.com>
Subject: Re: [linusw-pinctrl:devel] BUILD SUCCESS WITH WARNING e8b4ff6a856d02ee64a6023edf45e11827badeef
To:     Tzuyi Chang <tychang@realtek.com>
Cc:     linux-gpio@vger.kernel.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Tzuyi, can you look at this, I understand some of the warnings
but not all, and I need HW knowledge to fix the compile warnings:

On Fri, Sep 29, 2023 at 10:04=E2=80=AFAM kernel test robot <lkp@intel.com> =
wrote:


> drivers/pinctrl/realtek/pinctrl-rtd.c:180:29: warning: '%s' directive arg=
ument is null [-Wformat-overflow=3D]

I don't understand this at all.

> drivers/pinctrl/realtek/pinctrl-rtd1315e.c:231:35: warning: 'rtd1315e_boo=
t_sel_pins' defined but not used [-Wunused-const-variable=3D]
> drivers/pinctrl/realtek/pinctrl-rtd1315e.c:231:35: warning: 'rtd1315e_res=
et_n_pins' defined but not used [-Wunused-const-variable=3D]
> drivers/pinctrl/realtek/pinctrl-rtd1315e.c:231:35: warning: 'rtd1315e_sca=
n_switch_pins' defined but not used [-Wunused-const-variable=3D]
> drivers/pinctrl/realtek/pinctrl-rtd1315e.c:231:35: warning: 'rtd1315e_tes=
tmode_pins' defined but not used [-Wunused-const-variable=3D]
> drivers/pinctrl/realtek/pinctrl-rtd1315e.c:231:35: warning: 'rtd1315e_wd_=
rset_pins' defined but not used [-Wunused-const-variable=3D]
> drivers/pinctrl/realtek/pinctrl-rtd1319d.c:237:35: warning: 'rtd1319d_boo=
t_sel_pins' defined but not used [-Wunused-const-variable=3D]
> drivers/pinctrl/realtek/pinctrl-rtd1319d.c:237:35: warning: 'rtd1319d_res=
et_n_pins' defined but not used [-Wunused-const-variable=3D]
> drivers/pinctrl/realtek/pinctrl-rtd1319d.c:237:35: warning: 'rtd1319d_sca=
n_switch_pins' defined but not used [-Wunused-const-variable=3D]
> drivers/pinctrl/realtek/pinctrl-rtd1319d.c:237:35: warning: 'rtd1319d_tes=
tmode_pins' defined but not used [-Wunused-const-variable=3D]
> drivers/pinctrl/realtek/pinctrl-rtd1319d.c:237:35: warning: 'rtd1319d_wd_=
rset_pins' defined but not used [-Wunused-const-variable=3D]

These appear because there are for example:
DECLARE_RTD1315E_PIN(RTD1315E_ISO_BOOT_SEL, boot_sel);
But no corresponding RTD1315E_GROUP().

Can you make a patch adding the missing groups?

Yours,
Linus Walleij
