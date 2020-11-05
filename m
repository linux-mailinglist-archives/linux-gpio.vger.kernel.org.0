Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D11AC2A7C46
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 11:52:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730129AbgKEKwn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 05:52:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730061AbgKEKwm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2020 05:52:42 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 654CFC0613D3
        for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2020 02:52:42 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id k25so1072053lji.9
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2020 02:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IbC7h6sutytvBKVgRkW8YBm4v4oQThhwvuIz3XlFJpw=;
        b=d/RC4QlHsEU0Pk+87b5hebgQR1nvUbGfz+KWgyYPw8avJty+oHtYWwRBfI9ZwNnjQk
         6x1f9VNEkjxS+WacQizm9QFnRFRoNTRgXz7J8hUL7gDHTr1r0B4CDTIH++hxOUWPbRHA
         faB9Z1G3wfURCCb570cPMFzwdpYsz5NNLR9grwb6NletLAXur80zPGuj6TnPTgqIsI6W
         73tvdQLbSeHs/ZIHScGvMbbglljfvtEcmDpRr1SmCjt0Cs2115AxcxEJIltrAcsJpAIs
         i7f4CKXDgFTYIlx2Oia+shgKsQ9vbBqcm5RZnKYsE+6tO+5eUkPHBV9yZoGBsu8zWwxP
         sFlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IbC7h6sutytvBKVgRkW8YBm4v4oQThhwvuIz3XlFJpw=;
        b=L3+rPDKVOThsqvVHYGSiAr6jS3dybi12F/nryjhROlx4CZeozfGKz0QSSiil0Z2UpH
         tMdl4zENEzoEVMq3mJGfIhC0ktsSkK6LqTOtIFvEzvx7axBpjx4IUOREDKzsabL31BGN
         3lp9ytyzlimM9v9/z+poaUVRzrA17sa5cN2yXxDXHlQAEU22qgkZ44CNujTcodw49zyv
         s8bKHgW7lcS4ZH2ZdavaQlZbyl5SGzkcuzihV/t1YZ3x0PvDKkhm8Ox421aiMD2EP4BU
         C178l8r76g5QzvkL36BJCtYzrvEkK1/iGprf+RYGsA/GTd+nhonkH2Zx3eWtLli0g6Mj
         WPXg==
X-Gm-Message-State: AOAM530BqzdKR7Sy4gw+BVrsq2rUVViN1UG5qBAWgTvstyn9763U01oR
        z2Vt7YKywcwyFQwUEz/+IPgG4FvWml4gagoB06Xyiw==
X-Google-Smtp-Source: ABdhPJwMZsQSFYx3yHXvvtRlVkabm7C64j8LuP2+XUU2+XVFwAx/DWoa4YDvNPprZ43yAgspd5XcguY3mqI1O9Ir5Vs=
X-Received: by 2002:a05:651c:1205:: with SMTP id i5mr726163lja.283.1604573560846;
 Thu, 05 Nov 2020 02:52:40 -0800 (PST)
MIME-Version: 1.0
References: <20201027121725.24660-1-brgl@bgdev.pl>
In-Reply-To: <20201027121725.24660-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 5 Nov 2020 11:52:30 +0100
Message-ID: <CACRpkdYbpOZGmWONeOQFY7DE+t2ev30DQQ-8cxrJNoK9fVVunA@mail.gmail.com>
Subject: Re: [PATCH 0/8] slab: provide and use krealloc_array()
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Tony Luck <tony.luck@intel.com>,
        James Morse <james.morse@arm.com>,
        Robert Richter <rric@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Christoph Lameter <cl@linux.com>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        linaro-mm-sig@lists.linaro.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-edac@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        kvm@vger.kernel.org, virtualization@lists.linux-foundation.org,
        netdev <netdev@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." 
        <alsa-devel@alsa-project.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 27, 2020 at 1:17 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Andy brought to my attention the fact that users allocating an array of
> equally sized elements should check if the size multiplication doesn't
> overflow. This is why we have helpers like kmalloc_array().
>
> However we don't have krealloc_array() equivalent and there are many
> users who do their own multiplication when calling krealloc() for arrays.
>
> This series provides krealloc_array() and uses it in a couple places.
>
> A separate series will follow adding devm_krealloc_array() which is
> needed in the xilinx adc driver.

The series:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

I really like this.

Yours,
Linus Walleij
