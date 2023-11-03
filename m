Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1436F7E00DB
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Nov 2023 11:30:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346089AbjKCI4p (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Nov 2023 04:56:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343711AbjKCI4o (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Nov 2023 04:56:44 -0400
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86D44D46
        for <linux-gpio@vger.kernel.org>; Fri,  3 Nov 2023 01:56:38 -0700 (PDT)
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-586a516755aso1405506eaf.0
        for <linux-gpio@vger.kernel.org>; Fri, 03 Nov 2023 01:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gadgetoid.com; s=google; t=1699001798; x=1699606598; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zcKV6T/x/YbgTC7NecYTgD6nauPkJa+ydbVUoelz19Y=;
        b=oUy49Pak7dol5pJfpsx6PPZCsdPVo/cV/VRQATvzAcgZY7hW3C1tLnC7uAqMAbeVfT
         9EHk3a3VQ7Q19/oWKcoKMIcznRLi8Pdd9C18IckP+LH/CGhakKXjLLOK40A58TSh+Zcl
         bEnFbvFSUJ/Lsn0VciQvxVBTw/HLiM0egXJS9VJtN6eEil1UMqW/F568k5M4H6iHeh7z
         ZJvOWOYJu12R45axIpu4j4f2RX3ZxjlZiW9+iT+nsr3hhM3m/LY3zNee1EZuyNhGX0IV
         n6d982+DauOP5MRofHAjFeo/dZjDFr6BQ638fXHTCnzsP4OlCzKg3lz/bOqtcJJzRVf2
         UJCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699001798; x=1699606598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zcKV6T/x/YbgTC7NecYTgD6nauPkJa+ydbVUoelz19Y=;
        b=TAHkAeW4tWVbyUH35AqI6gDG783GkU6QS3gZSSRNTaz/llfdvuefn2gxHnYcpbSILN
         qWP2PEbt6+RsJb3Gjeawr8wnG/iLmzJ4uAhi0q3R5jac4HuYbC1MGVlnlNf7vm/ad6Ek
         4590hOJ9prJAfr7XS/te8bbiXEvvYZn50rWNVTW8FwCHGhvk9/xlVyt379jodUXq4D9y
         e/oVsVJN9abmim/Q4DQPSzOGZMBU/NBFYXH/+ugQGQG+5mYIPDkri8vASy7aXDPk/W0i
         JpPfarXjUACiT5vo/1J8TRqnFyENG3Jv/hW9StvuS337uJ/jsS+sQzqWUpNtX8Xq55me
         C9qA==
X-Gm-Message-State: AOJu0YzncMgUIMHHjjaBeCulTOwAkLLqSGyoDd+bH2L8quqf2TNiFH2R
        5fQ0SP/OqEhvIqJR8VZ9QKeRKaxdVk8aM8wet6GAWA==
X-Google-Smtp-Source: AGHT+IHFc1rbn6Y9PmoQSQ+Oh2g8r/6AR7jz+OSNR58Dtq80/bhYbfoig0txQTfEma/Y12yL3TIDrpXBFKkF9EmSgo0=
X-Received: by 2002:a05:6870:c98d:b0:1e9:d3bd:3ec with SMTP id
 hi13-20020a056870c98d00b001e9d3bd03ecmr1047693oab.22.1699001797824; Fri, 03
 Nov 2023 01:56:37 -0700 (PDT)
MIME-Version: 1.0
References: <20231025082707.821368-1-phil@gadgetoid.com> <20231025082707.821368-2-phil@gadgetoid.com>
 <CAMRc=Mdy3o1xPG6QHjp_p9aojVdZw3NgUO_WGjAe7W59wBPVDA@mail.gmail.com>
 <ZTkS5V6kRevIZNfA@rigel> <CAMRc=McTz=X7+tMWa2hkrSvkCDt=3OF=GyFgT_U48LVmXQ2mOw@mail.gmail.com>
In-Reply-To: <CAMRc=McTz=X7+tMWa2hkrSvkCDt=3OF=GyFgT_U48LVmXQ2mOw@mail.gmail.com>
From:   Phil Howard <phil@gadgetoid.com>
Date:   Fri, 3 Nov 2023 08:56:26 +0000
Message-ID: <CA+kSVo9FVJwA4bCoGHWMbB9mysrLb2=icqMSj=hkkadetOEKfQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v9 1/1] bindings: python: optionally include
 module in sdist
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

So, today's the day?

What's the plan?

On Thu, 26 Oct 2023 at 10:29, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Wed, Oct 25, 2023 at 3:06=E2=80=AFPM Kent Gibson <warthog618@gmail.com=
> wrote:
> >
> > On Wed, Oct 25, 2023 at 02:50:57PM +0200, Bartosz Golaszewski wrote:
> > > On Wed, Oct 25, 2023 at 10:27=E2=80=AFAM Phil Howard <phil@gadgetoid.=
com> wrote:
> > > >
> > >
> > > This now looks good to me. I'll leave it here until Friday and if
> > > there are no objections (Kent, would you mind reviewing this one?),
> >
> > I've got nothing to add.
> >
> > Cheers,
> > Kent.
> >
>
> Ok, I will actually delay it for a week until next Friday because I'll
> be off Mon-Thu and I don't want to leave stuff broken if anything goes
> wrong.
>
> Bart



--=20
Philip Howard
Technology & Lifestyle Writer
gadgetoid.com

Gadgetoid gadg-et-oid [gaj-it-oid]

                                     -adjective

1. having the characteristics or form of a gadget; resembling a
mechanical contrivance or device.
