Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD37719CA9C
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Apr 2020 21:52:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388126AbgDBTwP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Apr 2020 15:52:15 -0400
Received: from mail-io1-f44.google.com ([209.85.166.44]:43190 "EHLO
        mail-io1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726617AbgDBTwO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Apr 2020 15:52:14 -0400
Received: by mail-io1-f44.google.com with SMTP id x9so4926185iom.10;
        Thu, 02 Apr 2020 12:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=d6P9gFkqLTLqHnulKR4Er/P8B/YixzvfSWTBTjCDeiw=;
        b=fXQlDSas1xDUJ+bPpq612JqpZfX3G0xsjph5r9MtJEKXEgURlvgvBn0ntJLui2efmm
         K+d/G2sb8tX3S7uGa9b+5sMNTulv0JhR7GE0GOj2FN6uSwXUL2izuocUT3k7W3aYdtzx
         n1DinVFpRFQ0X/bwSV2zTZLvp9wESxb5LWT2vZBY9c953YIxXukl1St9Gs3JhtGGcVho
         rSd9EaQJjMy2nfCA4Js8zI1asj864KP0CwDBI4Gm57DmRo/WiFudLnLM2QNfLj1RDOoQ
         96mflqYD+MIl+df3ksNGYgxaAyppTxoIWjF7A7M9NpbFWugDVNAszgWhyNo9mFKjPFB4
         zUEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=d6P9gFkqLTLqHnulKR4Er/P8B/YixzvfSWTBTjCDeiw=;
        b=m4glYydF7S3BJzpHTjMElfwFMoycgUrAkvcWx7GcDsXTWq4Kjxkqh9zPlvTPzbWk90
         hycTZpPtDo6J4TrLMkalaIv3Ll8ECFOo0RUy0llJN2J8srSGE0JdbXNQq6OXbdC9zlts
         +kXiMkdMljh7kkvtb0lhStvFFvSDtSUFGOu2PpgHrdfb372TotljIi23iSz60N1E2QG5
         9McRnoHyccWCIQveH+8neKhDOHiL589qTJqw0he7DYZxORXo9FyBYgThXfsgfrMfvJnW
         eUUN2SnQdYOlyiihR9d+HKmgpAtpQ3PsDj/OMhj04XzYQPsrkIdEngzwUbLPTZdpLc1B
         hOZQ==
X-Gm-Message-State: AGi0PubsHGW6zjGihuPPLhplBhuQXasRGfJmFExj0uclh7Ndudz1XgXX
        nfoSy+2T3Bk0zfvy5Fq/vv+Pm+RcFYXRZnRk/gSNLI5PA3c=
X-Google-Smtp-Source: APiQypLBrSq8oA5qVK3DhEzgyasVFKJsSSZnsv0ZbgMP7/ZyTPoaOeCsXXGTU8ecf/PMc3HmSQ5SeaSDqi8MeqQPbos=
X-Received: by 2002:a02:aa8a:: with SMTP id u10mr4856332jai.88.1585857130206;
 Thu, 02 Apr 2020 12:52:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200402155057.30667-1-vaibhavgupta40@gmail.com>
 <CAHp75VcYSaAYx5qy7S0ppb77afgz=Ma=7=opfgSMCBnnjmoWfw@mail.gmail.com> <CAPBsFfAW6z=sP__SHj5Ln-3SHiYcLa4Me=CudAh3iw_Ypmr9mg@mail.gmail.com>
In-Reply-To: <CAPBsFfAW6z=sP__SHj5Ln-3SHiYcLa4Me=CudAh3iw_Ypmr9mg@mail.gmail.com>
From:   Vaibhav Gupta <vaibhav.varodek@gmail.com>
Date:   Fri, 3 Apr 2020 01:21:20 +0530
Message-ID: <CAPBsFfB9uUhZ24UV6heYuOf5_ss8Wx8bywGiq-1gq+h+S-JfWA@mail.gmail.com>
Subject: Fwd: [Linux-kernel-mentees] [PATCH v1] gpio: ml: ioh: Convert to dev_pm_ops
To:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> Thank you for the patch.
>
> Rather then doing this I think  the best approach is to unify gpio-pch
> and gpio-ml-ioh together.
> Under umbrella of the task, the clean ups like above are highly appreciated.

Sure! So, will the patch be accepted or we should scrap it and work on
unifying the gpio-pch and gpio-ml-ioh and other similar driver(s) (if any)?

-- Vaibhav Gupta
