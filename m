Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBEA66A2B54
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Feb 2023 19:38:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229569AbjBYSin (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Feb 2023 13:38:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbjBYSim (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 25 Feb 2023 13:38:42 -0500
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7526113D2
        for <linux-gpio@vger.kernel.org>; Sat, 25 Feb 2023 10:38:41 -0800 (PST)
Received: by mail-vs1-xe2f.google.com with SMTP id o6so4638769vsq.10
        for <linux-gpio@vger.kernel.org>; Sat, 25 Feb 2023 10:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RnWWmekMGlDfC5MA5Y61pEFNn2M2wXY9r4f3fFJ8yTs=;
        b=vSSZBsLccsYuXj+dh119DUBniN9DktveIMOryDVPpxlQM0TyWnHu3uxBhBhRlztNOd
         7vxxCOJbI9Zd9hEnyJRwNmn2CGMzF0dvcwGCfn2CMRM7w1IsddX40wGqjae2Z6kzuHCu
         ZN5z13FtVxe1uCvsHaH5Q8Cg1mjmpm5VxFdh/favFmRgq1Z7FBDC5t7lQcdwTAZbe8Ob
         6hJfIr5vX/WP2cwNxDVQ7Z7vDtzO8H7uR6Zj8QcvZO2GXkPu5IF6pSvrjLzKvc0LUPkF
         uvj2cMcOK8LD0B2uXHtil7pNv9rxFwF918NnmkiQAboarTu/H4y3aanYJg4a93uLW0gW
         HeZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RnWWmekMGlDfC5MA5Y61pEFNn2M2wXY9r4f3fFJ8yTs=;
        b=E2TZbRJqAPrfhZqJzC8agIoZW/YZFENu4SiBHnmkiTmrea4x2ZHjL5y+lFIUdHtWiJ
         IU0z5PhVSOTbvm8X6Wrmb+G3S+3U1kzDxuvX6PlMHdTrUsMl2RsQOLZfSJQM8HNs0ZZ1
         e44MZG66ZIAv4qI2UIJBPRRjdBMSO7Oaqxt1HIInDka5VHHIb3zhrE6043I3wrwlP+H7
         aZVTKFaz/Mzgn0mXnXGTZh7V0cHXebvWVjh2eJafG8L9J8aXLedisYitmNweaCZd9Geq
         UpNFPm6ktlKu6fibDvEy1CB4ay7+UF5WSP/MsXNtoxvLxhizCSg46dBNtkIrjv/T7UmO
         DIpQ==
X-Gm-Message-State: AO0yUKXaeC4hZUTBHXUSclLRENK03SdrWw/w9e7G081JP11uZFpGhIn/
        OJlT9ki/nnygKtngIeyu78/XwjSkHFbIs0Go69zPeQ==
X-Google-Smtp-Source: AK7set+xllFJwuwQsfb6lKZ37XHGP7gwwam3zUTOIGyNvbc+SNKdhc/aYRPKZr5QtoeqZ8eESMijlb0eGn8XIU+KIe8=
X-Received: by 2002:a05:6102:34c6:b0:402:9a0c:b682 with SMTP id
 a6-20020a05610234c600b004029a0cb682mr4669959vst.5.1677350321003; Sat, 25 Feb
 2023 10:38:41 -0800 (PST)
MIME-Version: 1.0
References: <20230225031235.3886280-1-benl@squareup.com> <20230225031235.3886280-3-benl@squareup.com>
In-Reply-To: <20230225031235.3886280-3-benl@squareup.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sat, 25 Feb 2023 19:38:30 +0100
Message-ID: <CAMRc=Mc=14fp=5nqux2M0OYi1Z=qJF8=G5t=J1oC_xNEOvSTHQ@mail.gmail.com>
Subject: Re: [libgpiod,v2 2/2] build: add Android.bp to build within Android tree
To:     Benjamin Li <benl@squareup.com>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Feb 25, 2023 at 4:12=E2=80=AFAM Benjamin Li <benl@squareup.com> wro=
te:
>
> Add an Android.bp file for Soong, the Android build system, to build
> the library including C++ bindings along with all the CLI tools.
>
> Signed-off-by: Benjamin Li <benl@squareup.com>
> ---

If I take it into the main tree, I would like to be at least able to
check that it builds correctly. Could you post some instructions on
how to build the android package in the least number of steps? Will I
need to jump through all the regular hoops involved in building
android images?

Bart
