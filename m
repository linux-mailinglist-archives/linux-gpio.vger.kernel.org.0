Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68DEF2A2E10
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Nov 2020 16:22:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726376AbgKBPUn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Nov 2020 10:20:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726171AbgKBPUn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Nov 2020 10:20:43 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD384C061A49
        for <linux-gpio@vger.kernel.org>; Mon,  2 Nov 2020 07:20:42 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id 23so1259105wmg.1
        for <linux-gpio@vger.kernel.org>; Mon, 02 Nov 2020 07:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=87j4CzgTjIznAlAGNVYlsLolKCjEqxgXtItxHQqBT+c=;
        b=Qx6XIDDkn/kgktIUkUO/8COUc5pZ7Xmrd4WIhOhtRKLqRH4jXfWsq4XQF+tviij2AS
         vQP1d5+o7im6WeNCxad2viztsEaWhYtaJWG1Vhj6E1J8UjnspJVoxf806Ry3jv4BdHop
         xwURD6IJS7yc8ElYCbGBoudPzERtKy2XkZUjWqe32YJYz8gF1KzLAhJg0Sgft+3IMCWa
         mV4JR08o+DnkkGEu+pVGUnHdRkfznAvaeW1sFyAveCP1kOZvsLyq+TKkJLfHFzK57TIm
         KW7GgBKwfAnVfidT0ZnlSAScho5vr6Rjk96VIp+X50g2am696JF1i4Ih5IAkrxiZq5BJ
         Pdug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=87j4CzgTjIznAlAGNVYlsLolKCjEqxgXtItxHQqBT+c=;
        b=qPvmvMSHAgRvu8XCQjMI17okV8+csBUZk5YCEtDq9FpNRWxaqzffZ7mJuvAKX4sX93
         c9oqgwzRxbUM7gpOzZekLFY2UZEKdblpJaJlI9c5XNA1QrVXqP0U1eNsRzUks9G4H64E
         w48S8IpdOVX69Gi6tuw2Ofs7F7RA79t7vsLryWQDpKxvnmjvxDdQ0w7qS19p/r4luTP5
         dgKYzjV4olGtKrE+dCnDzyOWedfZ+8gy3apdcAMndZ8m9WFjawwN5ZJzi3RJNiOjh7P4
         VggUGrS+KFeLcJUwwgnYiBG+G9I76mtgJqcQfmC+XvNqxkqGT68fl6C5ucshc96hqpq2
         7KLg==
X-Gm-Message-State: AOAM530MXFj+NCXv0J08pQwwjwso/HyAOtIZn4wpAqI3ZrZJqSG6HW9X
        nnG1gubYgN3zUjHILmuFpAFOrQ==
X-Google-Smtp-Source: ABdhPJyrNQzSj1QE+Qkm5CWvnTtBNZHgXZdYRD5QsBgAGl8HowPGK/ocdDyRBmSt205H50cLvofh/w==
X-Received: by 2002:a1c:9848:: with SMTP id a69mr18051505wme.158.1604330441469;
        Mon, 02 Nov 2020 07:20:41 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id b18sm15138014wmj.41.2020.11.02.07.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 07:20:40 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
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
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        linux-edac@vger.kernel.org, linux-gpio@vger.kernel.org,
        kvm@vger.kernel.org, virtualization@lists.linux-foundation.org,
        netdev@vger.kernel.org, linux-mm@kvack.org,
        alsa-devel@alsa-project.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 0/8] slab: provide and use krealloc_array()
Date:   Mon,  2 Nov 2020 16:20:29 +0100
Message-Id: <20201102152037.963-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Andy brought to my attention the fact that users allocating an array of
equally sized elements should check if the size multiplication doesn't
overflow. This is why we have helpers like kmalloc_array().

However we don't have krealloc_array() equivalent and there are many
users who do their own multiplication when calling krealloc() for arrays.

This series provides krealloc_array() and uses it in a couple places.

A separate series will follow adding devm_krealloc_array() which is
needed in the xilinx adc driver.

v1 -> v2:
- added a kernel doc for krealloc_array()
- mentioned krealloc et al in the docs
- collected review tags

Bartosz Golaszewski (8):
  mm: slab: provide krealloc_array()
  ALSA: pcm: use krealloc_array()
  vhost: vringh: use krealloc_array()
  pinctrl: use krealloc_array()
  edac: ghes: use krealloc_array()
  drm: atomic: use krealloc_array()
  hwtracing: intel: use krealloc_array()
  dma-buf: use krealloc_array()

 Documentation/core-api/memory-allocation.rst |  4 ++++
 drivers/dma-buf/sync_file.c                  |  4 ++--
 drivers/edac/ghes_edac.c                     |  4 ++--
 drivers/gpu/drm/drm_atomic.c                 |  3 ++-
 drivers/hwtracing/intel_th/msu.c             |  2 +-
 drivers/pinctrl/pinctrl-utils.c              |  2 +-
 drivers/vhost/vringh.c                       |  3 ++-
 include/linux/slab.h                         | 18 ++++++++++++++++++
 sound/core/pcm_lib.c                         |  4 ++--
 9 files changed, 34 insertions(+), 10 deletions(-)

-- 
2.29.1

