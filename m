Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26C1B5741BD
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Jul 2022 05:10:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230074AbiGNDKp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Jul 2022 23:10:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229925AbiGNDKn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Jul 2022 23:10:43 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13E182529A
        for <linux-gpio@vger.kernel.org>; Wed, 13 Jul 2022 20:10:42 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id g4so373461pgc.1
        for <linux-gpio@vger.kernel.org>; Wed, 13 Jul 2022 20:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8u123ZzFD49Yi1IZfAVRHBY6WGWce8D6HDBmq6aCFCM=;
        b=l3wkCWWeDRsB2aR3rU2PfQKKM1kn1oLN+v+zN8MyEiEQC6+BsJaB8uwFgUvsaF5teQ
         Pzeo4wlqgFEM7OEK9UdCbHSJjy1zc1awvsfNh6WGuwqx6QJxf83lcOcEplC3K/obBnlq
         rQuEbhX6DekrLZGcodbUlP9EvM6fShE2yb/NbU/B1hM5Yt0urDYvh3u44NqzT1Tu0j+W
         xRVNpHs/HsRkT+HQsSlaqP27eb4asxogKXc7XX4743iPNATsSEkumFdhevCp+rpXu/CF
         TLS7uECaS1nUNzeiGRpfcwIWytVuDm7BlSSeT/ZY24VRSKtH5qwor6ODqgDIdHj/KnOH
         bkfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8u123ZzFD49Yi1IZfAVRHBY6WGWce8D6HDBmq6aCFCM=;
        b=b6ueQGN52ER6xtp0tKjo7GiBBbh3QDmXsw5jIzu1Mo0XpGX4yL7XdnuHAgK7/eqsDr
         DdCP1cI4kRxW+nqJDBzsSCgQGwwlxhg7V8HayrMS2NLpAFOx7uOL5GZ2z80ySg1dfL1N
         MEDbkOWQrl4IXgDduT1X8XutEPHlMeIQsueom8OxKe5yGPtFMtsYNAD4lKalB5K5wbzD
         LlOPch6qb/Bcqbe4WKY3tc9gbBO5CnZpbABoJFL1hCNx4QAP1O2FaIbvcM0zCzaRoEnW
         6v3/j3hjH/Vwj4W8pAVcsT3rfhvNubH8+fzc9A7LoOUEf61hYdEPlYxljkX5xqRD7xSW
         2xXA==
X-Gm-Message-State: AJIora/nAqA6/UtMhUEcK0HHYD4ZzEn1aQzfxm4d+ocMnJQbXgPWEcAK
        x2LviFwAB7e6B4Z4umkm1C7SkGJKEMA=
X-Google-Smtp-Source: AGRyM1tCdrG814n7N4vw9ma3/BSnTUX9vAkooAQss/aD5AcYDR5gRNe4YmW4JSAuOpWbQlg/Y5BDUg==
X-Received: by 2002:a63:7843:0:b0:419:9285:fc92 with SMTP id t64-20020a637843000000b004199285fc92mr5050275pgc.196.1657768241564;
        Wed, 13 Jul 2022 20:10:41 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id d3-20020a170903230300b0015ee985999dsm173542plh.97.2022.07.13.20.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 20:10:40 -0700 (PDT)
Date:   Thu, 14 Jul 2022 11:10:36 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Alexandre Ghiti <alexandre.ghiti@canonical.com>
Cc:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
Subject: Re: libgpiod API v2 release
Message-ID: <20220714031036.GA74086@sol>
References: <CA+zEjCsqpAffGqJPJrsLJLeyrJJDch_-Qctb1Zxi+j5JU9Wg9A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+zEjCsqpAffGqJPJrsLJLeyrJJDch_-Qctb1Zxi+j5JU9Wg9A@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 12, 2022 at 09:48:45AM +0200, Alexandre Ghiti wrote:
> Hi,
> 
> Ubuntu kernels do not enable GPIO_CDEV_V1 as it is deprecated, but the
> libgpiod package that we ship is still based on the latest version
> 1.6.3 which does not implement the API v2. So I'd like to update
> libgpiod, do you have any recommendations about what branch/sha1 I
> should use? Do you plan to make a release that implements the API v2?
> 

Firstly, libgpiod is Bart's library so he is the authority, but this
is my understanding...

TLDR: You should keep GPIO_CDEV_V1 enabled.

v1 is deprecated from a development perspective, so all new feature
development will occur on v2, and new applications should target v2.
Existing apps targetting v1, be that directly or via libgpiod v1.6.3,
will require GPIO_CDEV_V1 until they migrate to v2.
The mainline kernel will continue to support v1 while userspace
transitions.

libgpiod v2 is in active development, and should reach its first release
shortly.
Note that it is NOT a plugin replacement for v1. It has a different API,
for similar reasons to why we had to switch in the kernel, so apps will
need to be actively migrated.

I wouldn't suggest making any effort to package libgpiod v2 until Bart
makes an official release.

Cheers,
Kent.
