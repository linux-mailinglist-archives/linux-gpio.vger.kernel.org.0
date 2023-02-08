Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91E4E68F1A0
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Feb 2023 16:09:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230471AbjBHPJR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Feb 2023 10:09:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230203AbjBHPJQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Feb 2023 10:09:16 -0500
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17595222CA
        for <linux-gpio@vger.kernel.org>; Wed,  8 Feb 2023 07:09:15 -0800 (PST)
Received: by mail-vs1-xe2a.google.com with SMTP id x8so1898728vso.2
        for <linux-gpio@vger.kernel.org>; Wed, 08 Feb 2023 07:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lFQgdM7J0TIFWdv1gYHa2vxrCnlPmo/nb0rgqit/Fvg=;
        b=2Rz0dZvEH9d9WTdqtiRyU7K2RGJh+6pbrfqRZgWuxJHgOjDlJ3uiNNiY3tm2rVhhDN
         odPMf42qd8bw2bPYlLnwnBPnNfeqb18Aut3zCngngoU+WZf57jFyg4pEhYOGZfwdDOkS
         aZudjQcWHrbiBhDuI/GxVf8/QwXeyr94uBjl9lP1D+j7RoC1QiKBL8NL1RUE2zPcu7ex
         ITv5C9GT6Er9/aQnGsODWFgz7NwFHT7622+fJoRuOK5+tuA3lS5bAKWMI3fBof/Ccbh4
         20Oey5+ssH05bd3v0/NkvE4URvjEowTvHwQBI/Ve6vwduXP28aPc1VcBJm3eiUN2ia3E
         OwDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lFQgdM7J0TIFWdv1gYHa2vxrCnlPmo/nb0rgqit/Fvg=;
        b=7aF7CHKdOSZgBvUEXsxgUD0cTrZEe/blTNIgrSpEfaDZ1z3vWG6oZcwHEGjfBm+LYH
         EP9sVcFX8mS2bhPNQJ8RODHuQp8N/+pI4KgVTDwaMGTi8rVA73PGNEBa4wFzeWNeIPQ7
         QDtsFUxW9Zj1VDG5kI9No1pPdLmXpddZnXzOXxL/Ax0c8WZJxtHO3eQn8wOHi091cXCL
         qorsqa6qUcLlAuu15BO+AB0/+Z26io+BsUauZ9COSZfeJteIAIO2HJRJgVcXPOlw6Ef1
         DWa5IQ2XA1AWStZNpWrX+qeEeQKNOgqQOothDVhAiVZW3+yxa6oG41eJFeuHm0B1Ri1A
         unjA==
X-Gm-Message-State: AO0yUKWl7o/wUW9x9L9C/Xz6OpDCAu3Md3PxIbaEQerpo/t8olUE3sP8
        yeCWDP8ES9pvtzfq8gk5SBRT6rAqNmjW/lXH1NlyYzddlNLrDLdo
X-Google-Smtp-Source: AK7set/DEc/edzqT3HxgzV8KeR+I6Nmhi/a0xJGfcoKUoKvN7uxdlQi8jnO2Wnsl3eC3+mrlAXi8KqUke8GMyiDdVgA=
X-Received: by 2002:a67:1904:0:b0:3e8:d5a8:3fbe with SMTP id
 4-20020a671904000000b003e8d5a83fbemr1931738vsz.9.1675868953847; Wed, 08 Feb
 2023 07:09:13 -0800 (PST)
MIME-Version: 1.0
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 8 Feb 2023 16:09:03 +0100
Message-ID: <CAMRc=MfHQ7_gPQO+anfi3S6ue=RyPdHbjc_0K5AQK9dRRKyawQ@mail.gmail.com>
Subject: [ANNOUNCE] libgpiod v1.6.4 released
To:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This is a bug-fix release for the v1.6.x branch and contains just a
couple fixes mostly related to configuring, building and testing.

The release tarball[1] and git repo[2] are available on kernel.org

Bart

[1] https://mirrors.edge.kernel.org/pub/software/libs/libgpiod/
[2] git://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git
