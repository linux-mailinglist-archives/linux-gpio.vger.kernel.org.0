Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED368730471
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jun 2023 18:00:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244283AbjFNQAy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Jun 2023 12:00:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245126AbjFNQAj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Jun 2023 12:00:39 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF5881FE5
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jun 2023 09:00:34 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6667643e4b3so363819b3a.2
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jun 2023 09:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686758434; x=1689350434;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+vWR6wIsuqaE+Rcb7D5u1DbpqrVExg8wJesoUAC7zUw=;
        b=n0xJIp1fsHBhRUbd/WEMlCuTbo9KGsP/F7HDJadyhvEEGgKyRehhMG/q2J5Ym8hlw2
         eVuOszZjkzkLZVwbFjGfr/oooZ22L45sgSaErcuXSpoozT4xj/KmXf4tM63a7LdJodiV
         +8d5cGwaW/nxBUbFR6V2RtOul1uiAE/BABf6H/7m1zCn3/XJLdz6JbjbgQU+VbaPivV0
         kc3DjMyxRXN5uB63fTTYxKkGyrFkA53obAkaNLhig/OVZ4VgqAdOupv31R0HA83aiDgZ
         0dbGnYOT6B7umivb2Q7fXgFYRQmDl1+zADbdXPbSJ1xNXjuRuzijF+ljySEgki9ZHAQH
         gVmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686758434; x=1689350434;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+vWR6wIsuqaE+Rcb7D5u1DbpqrVExg8wJesoUAC7zUw=;
        b=SUCIEZJDR7DPuKTztZ6qHGQuvH+VgDdXwfEQGWuv1CTqTOiAkqFz9dIeuMHVE4lpjq
         6Ecuot4HgmmiJs69VyumL0qv6gEJYVkfDMU2uD6XsZu21Pjx5/bSW68IRp03L70PBgX1
         Z+ns7p+wZ8c3ixqbMDtg+9G81FuKJf26YBKs+EWE2m+ksm9Q07lSjvZJ9JklmNMJVcmK
         cwTQoiWbT4n41r9FrTayyCwm0FWkMLMF9useXp/RIOb9Tw/t32cjKS1sneTLrak/oJf6
         aeGLf9evr6NQMYcAdwmuQJmZW0xpZuDgO4sfj+yKm4qMdguQXG+WcvGV37U+ecCbeuPu
         DGZw==
X-Gm-Message-State: AC+VfDwItnZ++SgNTDUgNCvPCRimaPdzX6rG9oo636zEDLRIw0aQ5KLV
        XN3BWqukOuCu3IvtHVEYQ+ayGbbbBKU=
X-Google-Smtp-Source: ACHHUZ4AWClLgcnTyM/V94/ful+WD1Zavs5LnYea28uV277o//ao3WMd+kGLq3aBVi3sswZTaehGsg==
X-Received: by 2002:a05:6a20:8f27:b0:119:d964:54f9 with SMTP id b39-20020a056a208f2700b00119d96454f9mr1967993pzk.37.1686758434212;
        Wed, 14 Jun 2023 09:00:34 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id s24-20020aa78d58000000b00654228f9e93sm10523136pfe.120.2023.06.14.09.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 09:00:33 -0700 (PDT)
Date:   Thu, 15 Jun 2023 00:00:29 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][PATCH 0/4] dedicated examples
Message-ID: <ZInkHSGf/HeBttPc@sol>
References: <20230614035426.15097-1-warthog618@gmail.com>
 <CAMRc=Mf3vtfUyprLcJ7g8Y_Jt0k4=FoKMjjxqRA__YNmqeCDLQ@mail.gmail.com>
 <ZIm+4qmSUgFrVzLc@sol>
 <CAMRc=Mc3-SfvYYYvocMyjLtbPk=f=EyAOHXcKj+eFWvVWrGurQ@mail.gmail.com>
 <ZInHSgsfALvbTmAX@sol>
 <CAMRc=McCKjU9NbarB-0awfUXwECMFna5aKi9yB68pwxHEebUhA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McCKjU9NbarB-0awfUXwECMFna5aKi9yB68pwxHEebUhA@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 14, 2023 at 05:11:32PM +0200, Bartosz Golaszewski wrote:
> On Wed, Jun 14, 2023 at 3:57 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > Any functionality to add to libgpiod?
> >
> 
> I don't think so at the moment. Do you see anything obvious? I know,
> we spoke about putting the line resolver into libgpiod but I'm not
> sure we really want it. At least in the core library anyway. The GLib
> layer on top of libgpiod is a place that would be a good target for
> such a functionality IMO.
> 

Yeah, making the line resolver generally available is a can of worms.
Not prepared to take that one on at the moment.
I'm reasonably content to leave that to the user - as long as they can
readily iterate over the chips and lines themselves.
Maybe provide an iterator for all the lines in the system
available to the user?

> Other than that, I think libgpiod now has everything it needs to cover
> all use-cases for the uAPI.
> 

The point isn't that coverage is missing, it is to find ways to make
common tasks simpler.

The ones that spring to mind so far are:
 - C: requesting a single line as output
 - C: requesting a single line as input
 - providing a toggle function for line_value, as it is an enum which is
   a bit awkward.
 - the chip iterator in the python tools helpers.py
 - streaming operators for the enums where they are not automatically
   provided


The C ones are specifically for simple sysfs-like equivalence, as telling
users they need to replace a single write to a file with ~100 lines of C
is really hard to sell.
The config options would be as minimal as possible.
I was going to suggest the user could always reconfigure the line later
if they need extra features, but there is no function to return the
existing line config :-(.

Cheers,
Kent.
