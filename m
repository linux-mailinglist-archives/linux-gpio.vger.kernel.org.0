Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECF4C6E9D6B
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Apr 2023 22:48:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231206AbjDTUsX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Apr 2023 16:48:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230010AbjDTUsW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Apr 2023 16:48:22 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6369A5FDA
        for <linux-gpio@vger.kernel.org>; Thu, 20 Apr 2023 13:48:20 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-54fc6949475so9337577b3.3
        for <linux-gpio@vger.kernel.org>; Thu, 20 Apr 2023 13:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682023699; x=1684615699;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1s4+/cbHWiZh/iCXUpa8FLuPXRBw/Nm+9B+Qw+lduKA=;
        b=rro0Pvf2M/gKo5DPWAwToeE2vubA8XCNfeoG3qRjW+UnNJ5miqlATW9N66HCMCkfYk
         VONeOAt+c1ZU6VJnm4npjhXZy/91M8N5gaJR6vYwNATyEag8PLSPW+lKeutL5RHZ/cYm
         A9k/N+PIOTDpAzWICz8/Cit/GEQRYH0hjrIjYBdYnRElJSxAOgE/nAPolEOaYJD5SfDb
         T0tKxDwbChlSffjJm2mIQbs9nkT1iccmYBfEOOOOKJBJVaUZ0k4YGcXYtNjEAkYKEjph
         3qPJeKEZ+WBmAVlKpexZtbBeR4IhEmU6y8Fu8GZ/5c5dyboL4+pkKKkaw6ry1Ff7K//H
         fLCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682023699; x=1684615699;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1s4+/cbHWiZh/iCXUpa8FLuPXRBw/Nm+9B+Qw+lduKA=;
        b=k4oaE6iTbhaS5BTUH607FvMWGZGqU1jhQ2OwnC5+lnOdGypB/4g7T8WD8K3hxZ/UXp
         sunaWHJYtherZ2Dka7j+G0yBACvyrtUifnkN9nd0q1Vzt0xq4L6FNJ3R5tXq2jkLUsUF
         KTlMnSIv/oQFC/q2+Hf50IEPTNAcVWWv8edX8Zg1BoGqOCRSv4+yxGFXJ0lTpJgnguiT
         bffaU7chymsUQ5R5w/7OsN2QFYUO1w4pJPZjaJnbXNctRERdjIFK8hXuPSg8sIImgDRw
         fdzD/Z3FxGTIzXLJwkjgvl4DzLMLNh7jKU0d7UAR7fUi5aDfRoVEMx5K05bGXq8PWCb3
         H2rA==
X-Gm-Message-State: AAQBX9cYVZNTRyT692wRnGWH3aHiQgTP2cQUDTUzTAD0ciiMehtMi8Xe
        NmPSo3ET3Lo0Upb02aYmzwYc5BWWiG9W14YdwXQ3Rn/rtTAG9vWN
X-Google-Smtp-Source: AKy350biGxnO2674MWFabAKg9RzxLz18gKesMEudr8dA6azLsbtUI4bV+aQhc/A4C81BQtu26PlUYe2gkZy1kFvxPkc=
X-Received: by 2002:a0d:ea42:0:b0:552:ae45:6e0f with SMTP id
 t63-20020a0dea42000000b00552ae456e0fmr106195ywe.26.1682023699504; Thu, 20 Apr
 2023 13:48:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230117084159.485234-1-linus.walleij@linaro.org> <0ec147e4-7be8-3187-0a37-249f42533724@nvidia.com>
In-Reply-To: <0ec147e4-7be8-3187-0a37-249f42533724@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 20 Apr 2023 22:48:08 +0200
Message-ID: <CACRpkdbS617tC0kd7a6KaAvabxM4CNDBnmYZu9TFg_hbWE-PaA@mail.gmail.com>
Subject: Re: [PATCH v2] hte: tegra-194: Use proper includes
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 20, 2023 at 10:19=E2=80=AFPM Dipen Patel <dipenp@nvidia.com> wr=
ote:
> On 1/17/23 12:41 AM, Linus Walleij wrote:

> > ChangeLog v1->v2:
> > - Its mod_devicetable not mod_device_table oops.
(...)
> > +#include <linux/mod_devicetable.h>
(...)
>
> I am not sure if I have followed up on this patchset. It seems this gives=
 an
> error mod_devicetable.h not found. Perhaps you meant,
> linux/mod_devicetable.h instead?

Hm are you using v1? That had <linux/mod_device_table.h> (one too
much underscore) by mistake, this v2 should work? What is
the output of the compiler?

Yours,
Linus Walleij
