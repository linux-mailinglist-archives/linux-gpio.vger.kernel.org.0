Return-Path: <linux-gpio+bounces-4938-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B40CE893092
	for <lists+linux-gpio@lfdr.de>; Sun, 31 Mar 2024 10:57:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 692CD282AB3
	for <lists+linux-gpio@lfdr.de>; Sun, 31 Mar 2024 08:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F4B81448D5;
	Sun, 31 Mar 2024 08:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rO63Xy4q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D461442FB
	for <linux-gpio@vger.kernel.org>; Sun, 31 Mar 2024 08:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711874755; cv=none; b=OE83wMJzCZkMrsFwfhc7ToSkFsXgs3GW+7TcZApYdIWPKyhMk3tz18hEcGivQxRuEDsZzO6NhL1moU5AeQZB8dPAVIcaYvomGBLVtITb//S/ste0RO/SiVANDc6cseskKViWXX8RnEv7BzvhoPtk0qqkUBVjaux20O6vzRYzRw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711874755; c=relaxed/simple;
	bh=JcKhWFch83brhdG0VtzetHVJQ40R24YKIvpYHZtTLn8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nlyPPhrMa9nEwyrFCJ82kCyh5bPD03wL3cIiHJ9qi8rj/YXCUBxocA6QnjcoTldOJZILxybUJjvWp9MLbh/CE7BxRGv0RyvptjvAZLMVYOOOh7IYJmLXiNZ+W2mxGuurkpQpliUI/30IG4VXrc9dnB+FtxM76YyqJqsz7Qss3uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rO63Xy4q; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-33ecb04e018so2448893f8f.1
        for <linux-gpio@vger.kernel.org>; Sun, 31 Mar 2024 01:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711874751; x=1712479551; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DTHQAQAXVP2yHTVyN3Qf81PY6hYlRsflmkOJj4KRX5A=;
        b=rO63Xy4qB92+3FqAqk1sC2M6fdoj//Auh2hmwujuj3NIeOhtb+ipsUfpyvc7Q68ejJ
         wbjFGt2Qfk9StveruxsCiYUySkjqNyecGC6RjRWASeqFfxA1P/MTrb2Oc5oNuSB90OIT
         VoYD1oes5IT33xWUdDY1nJsClgZhbZKDTdT/FT2JOR71yw6+4c8p+lqha0eMs+TKlU8C
         QxX688LuuBsXvVGw2JjFWwRDqfUxHNrHwu5+IMepKAVSu2dXyyCstH3g5zlRxVTxvVFM
         WEhjBwCkV2ntf6yrKtNwDpQFZXRk8Z/vowMD0TJdkzdoyQ9sI1DxwXx3qycpYKThc2Th
         Qgcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711874751; x=1712479551;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DTHQAQAXVP2yHTVyN3Qf81PY6hYlRsflmkOJj4KRX5A=;
        b=qr+PUQ4vlQhCw+GTsvHFkSnLN0r4fjni8fZzb6019Ry0TOmB2Gq8+G3qYKsddjBCEJ
         IGClptW3ft6EiCjdmFcGpbz2mkSIVOcKr37ib7Jt+PszCSW7LDe9MF3sziJP/mC5fTe8
         m9euop/icOKo/MYLzwpYA3aPRqFapUJok1oMDU5f3zxaJ7/hzPwnsawI2klkJJfebcnt
         //JPsLLcqc3AI9jmXZfeMe3Ck7/Y+dgOD/+W1hm9JbADWevwgVw8lVyrIdHADa41cE+w
         XfpOtWIr9lTNHSbTIR1qApVqi0YvtLOvUnU65ZRvIsfDpr+1IcBZG/jWYRHo2exNUNA4
         HVsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUP1NT4rnZ907hra+EwOmgOkBDQx7dYv7jVXU86Dw+gdDBIqq5zayf464NyQfyEdanUImKaQnCtgxWuatDEuciA7Fc9SlYEX+AtMg==
X-Gm-Message-State: AOJu0YypJP2MMsxk7Bn1HKvtRd2KB3Lwmv4/FOdwidapYG8bHvUQlkO8
	WfUAObmZI/pipUyNBIoDrt1ExKfUwYSfubwMs2MLwKpSClWmn2cLL4vl1XGN1Vk=
X-Google-Smtp-Source: AGHT+IGeuGXiCbCJT2fwDI0SEWizUJ9iibgMGqfwV7TaAR+tREdoNJwDLyVfYi67Bn1T1MJNDldUog==
X-Received: by 2002:adf:f804:0:b0:341:ddbc:fcf7 with SMTP id s4-20020adff804000000b00341ddbcfcf7mr3806166wrp.1.1711874750824;
        Sun, 31 Mar 2024 01:45:50 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id k17-20020adff5d1000000b00341b7388dafsm8436003wrp.77.2024.03.31.01.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Mar 2024 01:45:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 31 Mar 2024 10:44:05 +0200
Subject: [PATCH v2 18/25] net: 9p: virtio: drop owner assignment
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240331-module-owner-virtio-v2-18-98f04bfaf46a@linaro.org>
References: <20240331-module-owner-virtio-v2-0-98f04bfaf46a@linaro.org>
In-Reply-To: <20240331-module-owner-virtio-v2-0-98f04bfaf46a@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jonathan Corbet <corbet@lwn.net>, 
 David Hildenbrand <david@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Jens Axboe <axboe@kernel.dk>, Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, Amit Shah <amit@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Gonglei <arei.gonglei@huawei.com>, "David S. Miller" <davem@davemloft.net>, 
 Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Viresh Kumar <vireshk@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, David Airlie <airlied@redhat.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Jean-Philippe Brucker <jean-philippe@linaro.org>, 
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Alexander Graf <graf@amazon.com>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Eric Van Hensbergen <ericvh@kernel.org>, 
 Latchesar Ionkov <lucho@ionkov.net>, 
 Dominique Martinet <asmadeus@codewreck.org>, 
 Christian Schoenebeck <linux_oss@crudebyte.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Kalle Valo <kvalo@kernel.org>, 
 Dan Williams <dan.j.williams@intel.com>, 
 Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
 Ira Weiny <ira.weiny@intel.com>, 
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 "James E.J. Bottomley" <jejb@linux.ibm.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Vivek Goyal <vgoyal@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>, 
 Anton Yakovlev <anton.yakovlev@opensynergy.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: virtualization@lists.linux.dev, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-um@lists.infradead.org, 
 linux-block@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 iommu@lists.linux.dev, netdev@vger.kernel.org, v9fs@lists.linux.dev, 
 kvm@vger.kernel.org, linux-wireless@vger.kernel.org, nvdimm@lists.linux.dev, 
 linux-remoteproc@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, alsa-devel@alsa-project.org, 
 linux-sound@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=719;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=JcKhWFch83brhdG0VtzetHVJQ40R24YKIvpYHZtTLn8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCSJgSqws1ddSI6zt8bZXVN2NyD1CLEpfewZVv
 OwoagjJv6qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgkiYAAKCRDBN2bmhouD
 102lD/wIvu7W4oAOrFSz41pWQt8EAwtItoVXQB9hvcjw/YA+2zX+aydeb02+0qHLAQbGNHBdxfc
 yT1jMBjqC7hm1u0RTSxBcbJJzGs8e2DQ5Vhp70FBMhH5Suzn68J6dOPX6N5wHdff75zMWr9dJyK
 vSMxNyOJ19ThsLo5G/naBdf5gD/wl7GWZ/BynkDrQeahyUwT7EAmobRBH3C58X0PJzx1UeyIaGn
 BD4PrDB3XmtMl2+8fDS+Yga7XtwImkKcCKQmPYaMiOyK8nsvmE0G5mjoqBDyuvj3DbXP5PyEcah
 8siN4HSdpwXj68yE2KgItH1tHOp6PLEId2/8rHBD1Cf8LRqYUpJOSxYFlVCzh0QFv0epWEaRBFY
 t+sVw1BOnmBi6uJ6zpDaomcniLZ7+QMb6J8kX0aGCnE5xhfvD3GSVTn0b4+Zt9glME77oY2Csxv
 27NZ0gLAatWrCnBDi9A/Xe83MKDzfdh5+JqvpcrgsnvNQamvwK41r74/++Ec+O8FElCfF/VXAcc
 ON4Fxjm+sLJHUICUQYzW8QNCnzdVMi6R+G1UPZyqrIbvxfEG1TvL3Sd5Z+A14qs4De367Wz2+XG
 1OHZrEYXkqdpZXUSnF3NgkWODrQkgjG6Fl/9xfwVMVzKxPLTYE5G/yHlgDd6baxF42Rlh2MjRz5
 eR/43u41s6aOCmQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

virtio core already sets the .owner, so driver does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on the first patch.
---
 net/9p/trans_virtio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/9p/trans_virtio.c b/net/9p/trans_virtio.c
index e305071eb7b8..0b8086f58ad5 100644
--- a/net/9p/trans_virtio.c
+++ b/net/9p/trans_virtio.c
@@ -781,7 +781,6 @@ static struct virtio_driver p9_virtio_drv = {
 	.feature_table  = features,
 	.feature_table_size = ARRAY_SIZE(features),
 	.driver.name    = KBUILD_MODNAME,
-	.driver.owner	= THIS_MODULE,
 	.id_table	= id_table,
 	.probe		= p9_virtio_probe,
 	.remove		= p9_virtio_remove,

-- 
2.34.1


