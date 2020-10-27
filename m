Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 293C929C89C
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Oct 2020 20:21:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1829640AbgJ0TTh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Oct 2020 15:19:37 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:33580 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1829629AbgJ0TTf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Oct 2020 15:19:35 -0400
Received: by mail-wr1-f65.google.com with SMTP id b8so3216883wrn.0
        for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2020 12:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=94FVc/lhmQBJbpQ0I0StwCkg4DMhTbsduFiN4bjClk4=;
        b=Sld6hciHThDqeso8S8+jXbwutFt+C8GMsFv9uR38kkL9A2ymfTua46NMT/Q9ZBn3uh
         noluYBIeHRwknPmU94BZzwh6l7DE4uJbJLLOru2dF0iDS5wDVUIl89TAYeWKJJDtgD9J
         qGm+daZidj774s7wADWav2trLrU+zVLJfeX5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=94FVc/lhmQBJbpQ0I0StwCkg4DMhTbsduFiN4bjClk4=;
        b=N35yk/7r/u+/eaJvV7Tbi2lAb3xLbF7oCecdOTdTVG8RJDRyYSH3xSTJm8s3RLeD/2
         h8fDFAeTZ+mNFYyctuwm7rC52FhfqOFiwIfeei9ry6QvrQvqStTZdJEiDSFi73Qitlmb
         PJRi1f8moHTm93nZoxBGrVXNFs3635i04UmDLjWd9fGtegrkBiOd8NRzf7IQ1wYBWjXk
         0pDzcmbtYg13DdJ6Mchd7Y1iRBbFo56WbpT791BKLFONElGPheabSzzDT6NwRMYDjEyR
         nN6q1DKc4wKni+HZDBVCnu69X7zjaphauGMWkqLV33nEQnkUDyp/aveiqS3tcQkmhq2p
         Bl9g==
X-Gm-Message-State: AOAM530M4Mq0elW+FaIJVX8UjhxH7lS0cy/1pA6KxId7tPNBXD6UUb2i
        nbkxmzIYL/Y2RkMSWd5HRPKAeg==
X-Google-Smtp-Source: ABdhPJxSeCImtuoOwiJ2SgVqpZLT/QAEeRHxQ9b1eMNAwd7xtGe8jna3O2uLNWNIxJE6aH3a1ktGnQ==
X-Received: by 2002:a5d:4dc7:: with SMTP id f7mr4027819wru.375.1603826373382;
        Tue, 27 Oct 2020 12:19:33 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id h206sm3012251wmf.47.2020.10.27.12.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 12:19:32 -0700 (PDT)
Date:   Tue, 27 Oct 2020 20:19:30 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
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
        Linus Walleij <linus.walleij@linaro.org>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Christoph Lameter <cl@linux.com>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-gpio@vger.kernel.org, kvm@vger.kernel.org,
        virtualization@lists.linux-foundation.org, netdev@vger.kernel.org,
        linux-mm@kvack.org, alsa-devel@alsa-project.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH 6/8] drm: atomic: use krealloc_array()
Message-ID: <20201027191930.GQ401619@phenom.ffwll.local>
Mail-Followup-To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
        James Morse <james.morse@arm.com>, Robert Richter <rric@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>, Christoph Lameter <cl@linux.com>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        linux-edac@vger.kernel.org, linux-gpio@vger.kernel.org,
        kvm@vger.kernel.org, virtualization@lists.linux-foundation.org,
        netdev@vger.kernel.org, linux-mm@kvack.org,
        alsa-devel@alsa-project.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20201027121725.24660-1-brgl@bgdev.pl>
 <20201027121725.24660-7-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201027121725.24660-7-brgl@bgdev.pl>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 27, 2020 at 01:17:23PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Use the helper that checks for overflows internally instead of manually
> calculating the size of the new array.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I don't expect conflicts with this going through some other tree, so
please make that happen. Or resend once I can apply this to drm trees.

Thanks, Daniel

> ---
>  drivers/gpu/drm/drm_atomic.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 58527f151984..09ad6a2ec17b 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -960,7 +960,8 @@ drm_atomic_get_connector_state(struct drm_atomic_state *state,
>  		struct __drm_connnectors_state *c;
>  		int alloc = max(index + 1, config->num_connector);
>  
> -		c = krealloc(state->connectors, alloc * sizeof(*state->connectors), GFP_KERNEL);
> +		c = krealloc_array(state->connectors, alloc,
> +				   sizeof(*state->connectors), GFP_KERNEL);
>  		if (!c)
>  			return ERR_PTR(-ENOMEM);
>  
> -- 
> 2.29.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
