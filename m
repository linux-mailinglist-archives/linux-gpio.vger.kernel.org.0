Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49F516EA6EE
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Apr 2023 11:29:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231866AbjDUJ3R (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Apr 2023 05:29:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231923AbjDUJ26 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Apr 2023 05:28:58 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9334A5F4
        for <linux-gpio@vger.kernel.org>; Fri, 21 Apr 2023 02:28:50 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-b980e16b27bso610222276.2
        for <linux-gpio@vger.kernel.org>; Fri, 21 Apr 2023 02:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682069330; x=1684661330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tgquQtEsm7oPhv4OReUHXv8OWD1659AcrG/NzTNtbsQ=;
        b=pAiPYjBa/2MdVVT73kR/2XhxZzCkr5+GGphiOvJYqWwwegWt4BcHQjF1K8EFgJniCZ
         DO0syhgdNcXhigdPwSy9aBFpy9vtNcg5JvBMKYEox3q53aC8nI70TrhA9wpVOzqZT3jt
         vcFmDrCV52CW1uCEY82kWNjquV9UARPJcyK+p+vYRvcHVm2O1GKsbfEqRRTHdYNtTdG8
         ZvwWGscdi2bSxUgGFzsNd+ZMsugm7clG4YjUE8Fc5clq/VdiAqcsqlvoc4y144pFpYDn
         oho0pa2wMOjDzVOfwNmE4WpBnrODIqc500XWAqkSHlo2z530XuG/XbkHFNqxz5DKZOkk
         EmQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682069330; x=1684661330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tgquQtEsm7oPhv4OReUHXv8OWD1659AcrG/NzTNtbsQ=;
        b=iTpldcHSAO7lBEnUJj4VUj0NVlS10fgWN0nP+O/Yhga5KhpKEdSOdhorjvOBNjomj0
         h6owjEEhvp/9hLFr+cv/m2TGHjLv4SMsHVoFGWRnP3DCbf6YVSk7NUI2xc1Rji/L2FUf
         KptWmDjxPA2Id0I5pNamQDa/lMqHzdH8sLvsdGtlLdWUHbDwZtJFVTctPwOzedh0dPZU
         anrZF6UJYWckB7/dH+8pFqWCBB2FozsFQ0B5vO1btNPLVRgQXwIJPBuGkDLSqTa9k6yr
         tcn25eyTlLNHizsQz7yX9cQ0PVg43+eyc/UHZ1qh3eRxSlhvxdvg3Zh0FHKnOK5MaPsQ
         4gdw==
X-Gm-Message-State: AAQBX9dKT/c2Zr/LjI+bzzrESxaDLCqYP7ML67WAbll+OSqctDJ8B39T
        1wHzx3oyGGTKaoBTWQOcqkfYLWrnfbsAPGq8uZkzgw==
X-Google-Smtp-Source: AKy350ZDou5IkqF07YuuyMhcPw5wqADmGYKIbAe2hYMZHvb+99PW2PnccQxbwAlLQM7OjFrQQyinf2OcGI1uxt2tZM8=
X-Received: by 2002:a81:8a42:0:b0:54f:cfbf:22fa with SMTP id
 a63-20020a818a42000000b0054fcfbf22famr1424597ywg.25.1682069330159; Fri, 21
 Apr 2023 02:28:50 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1680793130.git.oleksii_moisieiev@epam.com>
 <54119b2cb43e29f69c5858a5320d3a58f23fed21.1680793130.git.oleksii_moisieiev@epam.com>
 <ZDcqx9JVMvqr2WYu@e120937-lin> <6dc456ff-7fc6-3b73-3727-dd048e9a9629@oss.nxp.com>
 <f73f39e2-81dd-4204-a3be-c5e7f5e54c1b@epam.com>
In-Reply-To: <f73f39e2-81dd-4204-a3be-c5e7f5e54c1b@epam.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 21 Apr 2023 11:28:38 +0200
Message-ID: <CACRpkdY1eSdWX6+azn43MO77urVf_t25wgZtuyTwKHw4v+QYNg@mail.gmail.com>
Subject: Re: [RFC v1 1/2] scmi: Introduce pinctrl SCMI protocol driver
To:     Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc:     Peng Fan <peng.fan@oss.nxp.com>,
        Cristian Marussi <cristian.marussi@arm.com>,
        "sudeep.holla@arm.com" <sudeep.holla@arm.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "michal.simek@amd.com" <michal.simek@amd.com>,
        "vincent.guittot@linaro.org" <vincent.guittot@linaro.org>,
        "souvik.chakravarty@arm.com" <souvik.chakravarty@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 21, 2023 at 10:40=E2=80=AFAM Oleksii Moisieiev
<Oleksii_Moisieiev@epam.com> wrote:
> On 17.04.23 05:55, Peng Fan wrote:
> > On 4/13/2023 6:04 AM, Cristian Marussi wrote:

> > Is it possible to extend the spec to support multilple uint32_t for PIN
> > CONFIG SET?
> >
> > With only one uint32_t could not satisfy i.MX requirement.
> >
> > Thanks,
> > Peng.
> >
> IIUC you are expecting to have an ability to set some kind of array of
> uint32_t config values to some specific ConfigType?
>
> I'm not sure if it's supported by pintctrl subsystem right now. I was
> unable to find an example in the existing device-tree pinctrl bindings.
> This makes me think that this kind of binding is OEM specific.
>
> Maybe it can be implemented by adding new IDs to OEM specific range
> (192-255) which is reserved for OEM specific units (See Table 23 of
> DEN0056E).

From a pinctrl point of view I do not understand this requirement.

The pinctrl subsystem in the Linux kernel certainly does not support
an array of u32 for the pin config, we only support passing a single
u32 value along with the enumerator (config type), or well it is
actually 24 bits in Linux, the uppermost 8 bits is for the config type:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/inc=
lude/linux/pinctrl/pinconf-generic.h

/*
 * Helpful configuration macro to be used in tables etc.
 */
#define PIN_CONF_PACKED(p, a) ((a << 8) | ((unsigned long) p & 0xffUL))

p =3D parameter (PIN_CONFIG_DRIVE_STRENGTH etc)
a =3D argument (value such as in mA)

Yours,
Linus Walleij
