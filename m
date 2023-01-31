Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14EF26832F9
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Jan 2023 17:47:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229504AbjAaQrS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 Jan 2023 11:47:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229900AbjAaQrR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Jan 2023 11:47:17 -0500
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBF8D14229
        for <linux-gpio@vger.kernel.org>; Tue, 31 Jan 2023 08:47:15 -0800 (PST)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-15eec491b40so20051435fac.12
        for <linux-gpio@vger.kernel.org>; Tue, 31 Jan 2023 08:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lTg6f+0h1jvRJ/j1toK0cjaXCI0vfg8Jz49I2OtGH7I=;
        b=DCdr1pUIcQxIe9PYMsnMLDSEWQ+ig1io7/jaKoPEfP2uyUK4XCXH7lPuej1W05S4pd
         jtB0CFKRWtRUK3d7plu+j2tG16y+eX0eWlTVCmGNUo4YqLI0oTZqS9ZUeYUzU/dpyx/C
         9/51o5Hzhiw7QiBGkbaKSF8ftPgqAGro+ORpvt7y3UWUf23HiiwV/ix7falahK88kdoe
         kB0uUTMo2JXvklfZXNnT/gkzV53qu1m6hhHw3bHnaylwKsI5eotW7Q71vzwdwb1r7L8t
         bcQYpFTMScVRzZEEKyqgynxJf6SyshpaBcOlCvRsa0OpMxU8O7XT3b/4f3Q5R13YSFHt
         2RGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lTg6f+0h1jvRJ/j1toK0cjaXCI0vfg8Jz49I2OtGH7I=;
        b=gqccsUWZCPCiG+nFUlk77HXNsa5vel88OYyAQk3Go+t9Dex5SHBYhaMf+k8Bzjzlun
         C29S1w79k4FOZRqWMLx9gZCSMIa0wZlX/qCNLORMyXYupjZ5AXnFiCT1YC1/tv7wAGUb
         uHevL3xrK/OKdzjoCdSngzJ9XROZ18eQeHJu0Nr+mUDZeDCj5ZKBVLqhu/uYAJPbjpL6
         HYlH+jDG/fOBb4ELdhCZH0hIT1rvG2sy9VtwOYG98x22/Q8LA7JBl48Ts32feVVYrbjB
         B1bphPl4UYzj6GAK08oj+LXhvJB6xgsMD4FIcyvKzWDlm0uxWeqMSKNbmjNHbJVuoojT
         fO6A==
X-Gm-Message-State: AO0yUKXNT1VJwxff0N2Jmv8VtOhAKzm7E8sb2WfCQfFN23O3w+aDJF+i
        tuEoLbaMHLpe4j51OAuQNWgcPXB1D1cnC4jyosOaOb2ibjaYtg==
X-Google-Smtp-Source: AK7set+OlyBijlX/QaPUYnpGvshLMalNpOye3bILf+3od2u5IRIS5rzHpF6YyZsCACv1Lm6h8hiGjzieUxH9qAdk/Hg=
X-Received: by 2002:a05:6870:2409:b0:163:925e:abb6 with SMTP id
 n9-20020a056870240900b00163925eabb6mr1192417oap.286.1675183634613; Tue, 31
 Jan 2023 08:47:14 -0800 (PST)
MIME-Version: 1.0
From:   Hank Barta <hbarta@gmail.com>
Date:   Tue, 31 Jan 2023 10:47:03 -0600
Message-ID: <CABTDG88t8_6s0ahuEKAxXsJD1KP0OuMoS-Mqi+qoeJuHutk4Qw@mail.gmail.com>
Subject: I2C, SPI, etc for libgpiod
To:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi all,
I've been fooling around with libgpiod on Debian (not R-Pi OS) and am
fairly comfortable using the APIs it provides. I haven't finished that
exploration yet, but looking ahead, I'm curious about usage of some of
the alternate GPIO capabilities aside from reading and setting inputs
and outputs. I haven't seen anything about those in the information I
find for https://libgpiod.readthedocs.io or
https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/.

Is there support for these alternate functions or is that something on
someone's TODO list? Are there other libraries or APIs that I can use?

I've used WiringPi on R-Pi OS but that project seems to be foundering.

Thanks!

NB: I'm stupidly/bravely sharing my efforts in this direction at
https://github.com/HankB/GPIOD_Debian_Raspberry_Pi

-- 
Beautiful Sunny Winfield
