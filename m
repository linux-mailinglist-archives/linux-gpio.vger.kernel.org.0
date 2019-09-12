Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EB84B0B5A
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Sep 2019 11:27:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730682AbfILJ1q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Sep 2019 05:27:46 -0400
Received: from mail-lj1-f175.google.com ([209.85.208.175]:39513 "EHLO
        mail-lj1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730185AbfILJ1q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Sep 2019 05:27:46 -0400
Received: by mail-lj1-f175.google.com with SMTP id j16so22923195ljg.6
        for <linux-gpio@vger.kernel.org>; Thu, 12 Sep 2019 02:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JpcI7FrS2w6Xqk0F2kUP0BsppmcK8G/GGSDXDOYR8y0=;
        b=r/hxtp4ZqrtonM24oXnL1EYjp9/rfqdyumpIzzQuObsG9Jp0vuzTy1JOD8EzXffkzF
         fni3r+jgI2K2T+5nDRCxpydSF4xiCihN2Fi01LDDPYqygNd7rAp2NEVl9nZd1NYjQjTL
         KVaoy8Z+C5MAWm0SEfpT4zZRnTfBxDHSTjUnZbzc7gDWUZHl2yxHv31gWPQq6abwvOP/
         U1g8urXVgH02GitxOhwsfAcNp8zbcfBx+alE5l3vDMBxZwh9e6oFDEd4rrrm97bUMucS
         3jNJ+DDJufkfpvB0cstZ+SD6rXwIvoOqaHIOjmNjaZeeewCP4enIc3j7mX8hBwSxx1Tv
         q6XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JpcI7FrS2w6Xqk0F2kUP0BsppmcK8G/GGSDXDOYR8y0=;
        b=TikZgYk50bCO5e6ZtrBu+L9TbP44Vtkb2nr8S7oNeohdwIQBx54xh0UNMrHL1qyvtP
         TEiDK+3R5lFhb2yf7duZGmXZnezJuoARVjtpgGsLp2ElrPSMHgLBpD5zvr2Z2c0T9w/l
         LBSkPR5wTas1m516QrQt7TEmrncEkdsAbfcAw6+LFm1THiJgCOqVV9PIiEflsqeUO0OW
         2JcdWPg4p59/7axdyWaxuzEczT6jCNBRsGtc8F7fxymuLRo06pSCNgBFSiOoT9zmcxsn
         VDL0MFHzbYZLxG5QF0zFGX1ugIWipnYUZvPafDUCxvaVhLY4E7rvfYaanQYKYUG9JxmK
         t59g==
X-Gm-Message-State: APjAAAVNJ9f3uTlKKPR7SF1DkM0qN1xcitfBGW4DLWZ3hIIq4dbX6ZGC
        xr2yd4KD8Nn1DG29EmCmHEG6I/RqPStyVFDTHqvBWw==
X-Google-Smtp-Source: APXvYqxH82INV5iA6c4Cly5SpcklGIt9KRrHiNdQbIYBM29OIngkky6DtBiWMmPlgk72KLlPKFZ0RvC22BlFAD01NZM=
X-Received: by 2002:a2e:9dc3:: with SMTP id x3mr22329810ljj.108.1568280463763;
 Thu, 12 Sep 2019 02:27:43 -0700 (PDT)
MIME-Version: 1.0
References: <08ac3d50-ae2b-060f-0210-4be213b6c97c@korgrd.com>
 <CAMRc=Md9yD6U+_BAEY_pB1vdri6oZuMLwAhvDuAgpee_bQEpVA@mail.gmail.com> <CAEf4M_B2RXbv-B2fsU-15iF56bO0_K--UeSdmdXHqgYNjCTbYw@mail.gmail.com>
In-Reply-To: <CAEf4M_B2RXbv-B2fsU-15iF56bO0_K--UeSdmdXHqgYNjCTbYw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 12 Sep 2019 10:27:32 +0100
Message-ID: <CACRpkda_oXz0Dv064MiHrctmmPHca3B8LotiHUd8Z3TAuwVLcQ@mail.gmail.com>
Subject: Re: [libgpiod] hopefully simple question regarding pull-up/down control
To:     Drew Fustini <pdp7pdp7@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Bill Barton <peabody@korgrd.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 11, 2019 at 12:19 AM Drew Fustini <pdp7pdp7@gmail.com> wrote:
> On Fri, Feb 1, 2019 at 4:07 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > As for your question: it's in the pipeline, but it's not a trivial
> > task. We first need to implement the kernel part, then define a
> > future-proof kernel-to-user-space interface and then implement the
> > support in libgpiod. For now it's impossible to enable configurable
> > pull-up/down resistors from user-space.
>
> Hello, I'm curious if there has been any further development towards
> being able to control pull up or pull down through libgpiod.

I met with Drew yesterdat and we decided he will take a stab at fixing
this for the benefit of all Adafruits etc.

Yours,
Linus Walleij
