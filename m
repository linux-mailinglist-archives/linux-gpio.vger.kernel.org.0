Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62BC756324E
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Jul 2022 13:11:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237145AbiGALLJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Jul 2022 07:11:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237138AbiGALLC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Jul 2022 07:11:02 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8E99814A5
        for <linux-gpio@vger.kernel.org>; Fri,  1 Jul 2022 04:10:50 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id h187so3537818ybg.0
        for <linux-gpio@vger.kernel.org>; Fri, 01 Jul 2022 04:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rNioS2cEvxSnSqiUtA7cGnzbHcg+R2Grzz9PHfHTHqk=;
        b=D0McNkDmNEmGdYoOTwB/K4n507E6as3zdZrpIfw/OZO9QnVCrWiIqTLhGreIToZLok
         XWh2sQfWvX/dL0dzlr+kfnQSlgB1qRanUVm2BzqT1c4U8pzlSeQFEgi7HMO+w9Q2PPi+
         VZMII18LSA+cP/tX2//kLn7f8+6mmpriw+wGYs01z54tvuRHCsXgrsHOgbxEp1UEpI7Y
         BmAs8TtXGjaUPT8EC6kS1EbaOjSlaoP171My99sxn0CpCdIpqis4h3V/HI+9Ksymgtik
         yUsEzcztkyjUc9wjRRqjfgriGcYwFFQvtxVrkyyVnnKUg0YQjaPpS7oCtdbIuEBgLcHM
         1ffQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rNioS2cEvxSnSqiUtA7cGnzbHcg+R2Grzz9PHfHTHqk=;
        b=7j5V/FRl/k9yA9WyPelYgfV1eOGRrn4JxwO81HKd5KoInLg+lZuxe7VI73tpPpNc2i
         gxObQtvUqVEGERyhaxsmIW0RGEtLAMqjv6gWepX6FL++41vItu2Na+3/k1YKuhMsVwTk
         r1t5bCeBTjEbQFvADhOJZljTr5mqV2AmZjNaTL53NBVvBqEfXBepDpP2mlZN0GbfJyCj
         C5rPHh3ZBsdM3HUHkk74zDwi9FsWkdjXTrGmfdflWOeACLyrV6Kt2xXXVOk3qLCC86Ai
         t4sbagMuy4/RauFqM6DHHXl7rjcrDktaon0ZcXRbNX234LtUg9JCmwz0+bC61LaHr9Yn
         /dLg==
X-Gm-Message-State: AJIora8wkuMLd2Q0g9bw4U6ngPP0Wi7f0fqL160Mzqny9tJIPbGB2lLw
        2Bp/xcT6PIwBAJkNlNOFu4yP1zs39QFoxTruVLY=
X-Google-Smtp-Source: AGRyM1taK3IRPUEYDeff0LBJYQrfgnofx/nVJ+ELjcL7JWAXqTbFlc+BglP1a6dSpruio0Edf4DOeQ3EZSUtDI6afbs=
X-Received: by 2002:a25:187:0:b0:66c:eaea:71ec with SMTP id
 129-20020a250187000000b0066ceaea71ecmr15172124ybb.570.1656673849740; Fri, 01
 Jul 2022 04:10:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220701110025.58399-1-brgl@bgdev.pl>
In-Reply-To: <20220701110025.58399-1-brgl@bgdev.pl>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 1 Jul 2022 13:10:12 +0200
Message-ID: <CAHp75VeG3=uAk6V6MD9soFytrjsDgVnWNK8CodDW+_aY7f5Dug@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH] treewide: allow polling functions to block indefinitely
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 1, 2022 at 1:06 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> All polling system calls have some way of being instructed to block
> indefinitely until some event is registered on the file descriptor.
>
> Make both the gpiod_chip_wait_info_event() and
> gpiod_line_request_wait_edge_event() accept negative timeout values in
> which case the underlying ppoll() will block indefinitely.

Long time no user space done by me, so here my silly question: how to
kill a task that is blocking indefinitely in ppoll()?

-- 
With Best Regards,
Andy Shevchenko
