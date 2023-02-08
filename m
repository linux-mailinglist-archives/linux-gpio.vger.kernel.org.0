Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5900168F19F
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Feb 2023 16:08:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230310AbjBHPIy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Feb 2023 10:08:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229827AbjBHPIy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Feb 2023 10:08:54 -0500
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F4FD24110
        for <linux-gpio@vger.kernel.org>; Wed,  8 Feb 2023 07:08:52 -0800 (PST)
Received: by mail-vs1-xe2f.google.com with SMTP id g8so4925707vso.3
        for <linux-gpio@vger.kernel.org>; Wed, 08 Feb 2023 07:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zeOivge4JY4ZhqEAvusqUka7mOD4A26CiCdVSvNSfr4=;
        b=MLD6fRXjeISFOMIQ189eh9/hwxzH+sp9k6KfCs/LAmek6FQY6mINFUmh37exrFfB9U
         PGTHY0QVwIFsMFOhNgzra3L9pMw+0SUc6hnyrc9vUJm7E9a8Gu8K2K+0DNFRxYGmMJhm
         rNc+Cy/oOZt3/AEzH3ppB4FTEhuURzRwSdsrlf0aYKwsDv2aJ17NpmKdRyzXZvGKW4BS
         5knB+4ECdOXc8kpe5u95LllXmJIxg4WdiczIfn1iUeFkz+eq5orda61VqXPXgVYCGnbt
         0a6HOJbCF5DfR1ztbV8JmHA+RjBX/HfypCeQWv/ThGCj7gvnIBbasLpSGVFIezs+wQhi
         3CJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zeOivge4JY4ZhqEAvusqUka7mOD4A26CiCdVSvNSfr4=;
        b=ZyHSDEqBZKgkT+iM1lia1VZZHPiefP+vipkU3xVHO0r3dm7LvDnFJUQG8joLKpKbet
         IS+KhmYN6n3be42pZ9077n4qqegeoM1F2/1THVyGh79DlhNFxCHr5UelkgnpVY9iR90l
         Nc3tXUaa//gVXIqdKvXxBTX06vjgWEzKaTprl0/jgkE12UsBbsba7GpxJ2vkkK4Xujf7
         E0BoMxznuHX9a7QJBP20m4DUrM9empVpyy+9469ZfEjqSZnqd4iqIsEaPrcd4dNahr2+
         T64/aoqo/XRM9+x4utqyZLbnd9yf/hIpg4XSqIfJ4NY1cn9msoIT8HbKnSwTrHI6NW0t
         o/PQ==
X-Gm-Message-State: AO0yUKW1h6BxQoVDs9zIw80mBSefutlIyNAmR8Qx77jkIF+yiQLS/SRS
        DigahTIVsYZ3YsbL7vB0NtTmxS94eDBdlCDK1aC6z3cmH7kO2CNl
X-Google-Smtp-Source: AK7set+gOe2QeJRNSkShfpWdtaZ4c0XnXP/uGLg0vztKmB8/Mw9KHLGRGSL9fsPSealGyc31UqsGk3OPNSemi9uHieY=
X-Received: by 2002:a67:c908:0:b0:408:6a8f:d1c6 with SMTP id
 w8-20020a67c908000000b004086a8fd1c6mr2064151vsk.73.1675868930939; Wed, 08 Feb
 2023 07:08:50 -0800 (PST)
MIME-Version: 1.0
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 8 Feb 2023 16:08:39 +0100
Message-ID: <CAMRc=MdyS6CsMkyvRL+_Shr__QnYxXE_Di6DqRKvh+QB_A3Qgg@mail.gmail.com>
Subject: [ANNOUNCE] libgpiod v2.0-rc1 released
To:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There have been no issues raised since the RFC so let's get it out.
I'm tagging a release candidate that I will also try and make
available in meta-openembedded with the hope that it will get some
exposure and testing before we commit to a final v2.0 release.

The core C API as well as all the bindings and tools have been
completely overhauled. There are too many changes to list them all
here - please refer to NEWS and the docs as the library has been
entirely rebuilt.

Thanks again to Kent, Viresh and Andy for the hard work on designing,
writing and testing the project.

The release tarball[1] and git repo[2] are available on kernel.org

Bart

[1] https://mirrors.edge.kernel.org/pub/software/libs/libgpiod/
[2] git://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git
