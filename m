Return-Path: <linux-gpio+bounces-4930-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 944B2893024
	for <lists+linux-gpio@lfdr.de>; Sun, 31 Mar 2024 10:52:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 496222826C3
	for <lists+linux-gpio@lfdr.de>; Sun, 31 Mar 2024 08:52:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B92D1369A8;
	Sun, 31 Mar 2024 08:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FgPHi7Vl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5ED0136658
	for <linux-gpio@vger.kernel.org>; Sun, 31 Mar 2024 08:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711874718; cv=none; b=GLzmsYsmIEdwHsku+D9JLZOwIbYEGu3UdbV0BtWHNy/MjCvXb5WrZ5ssr1cX0kz6GYnuai0x8V5gg6Tcw10FnpZK3ALl9VobGSXaWIP3tVDAeeN9MPMSMPZcwN9g1g1zmwl82TzPBDmcNXBFqRdj4LeWgv6Zp+NsT/1C4dlDKXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711874718; c=relaxed/simple;
	bh=BF5+L9M6rh/9q/lpIn327dnJkaSg5SfZZk5BFIHRLEw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CVxYtTR3h8mWnPH2Jl6fQcHkINeqLRBRmnOCFXLxQBftIuzHttItEXYk+rsVC2IszuoaLFK19GIt9pA7uE6KNWnNUyifmrb8r0GiC95KlaIhtBG/PC+nO6UukCJQBI2bgTw6YmeQsA75PUnjHPtKUOFE6d4O46QcBhmDX5TJSjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FgPHi7Vl; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-341cf28e055so2398845f8f.0
        for <linux-gpio@vger.kernel.org>; Sun, 31 Mar 2024 01:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711874714; x=1712479514; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X5+XUlpPqxzudteQHjuSJRjlJzQJhMWAmtNdNyAF5ks=;
        b=FgPHi7Vlhk8uHEhOvBfXi3Qv7Sqs07ZK/27f//912sA7UXWmYYIEZPr4Lk8y0SoiJQ
         nrkDnJjb7hS3p/xAT7TLpN1H9M1o3tf8cvEldx4ED8Dh65csp2iSoOrPW/1jYCFeT3ZY
         vZjjaq8XFvYI5+Wcm/5dL9OOP1KBVYgOgVIA9ZKdUsFFem6szNZJ9XqxpZL4UueS0jsV
         J2vtEHdtzgID8AU1CygAdrCrSpeRxIN2VB/CIcyolNl8S76XXQ9Pw8roiH4UXdHVTAUP
         /vwtbY43Xr/92typVI0ZTbcRqYAK+Zv4gi+mbEPGHGy7A3OFy1nA8Pkz7OjOAsXVDtwW
         13Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711874714; x=1712479514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X5+XUlpPqxzudteQHjuSJRjlJzQJhMWAmtNdNyAF5ks=;
        b=kLuTAfFGH42dkBmFyZui0lW81t0yJv80khWSGP3s1AMFQWHbVvqdNIWRkJxDxdATS4
         jga6WU3liQ+x2Z1YPk4UqmEszRD5ecICJR+0mHACRXf3tfCuJwTPJIH47l5kVVIZt766
         aHW42JF8xS9lH2iS8hvjBEEUWBz+OjAPysWXQNhzfN+xmVQ/NJcQLtUz/Ma1REDl2jwl
         DbUdjs0cYLWgm3Aq2e4J5EOHuSVTU7RBt1L+RwguHExKE40XPD3CMIjsb6HLdCYmd/9C
         77ycBJffXMBYNdBAmFZFSfXQNpq1ZT1AjzxSkQSUKjvu5V/xE7bLJY4LCKd1jr2zhVw8
         aUbA==
X-Forwarded-Encrypted: i=1; AJvYcCUpoIXt6ySSmwJIfx0AKnpZRURZCmKrj5/9lPmoJXVJmKqgCL8YHDmuQ9KrZ/UFv9m3ca9ZMMDF30K7jvAsEjM2t4t3JxmI6qg3pQ==
X-Gm-Message-State: AOJu0YySs9o2CiVGDCWPBuiVIRQm2JLosxj68Zi5+IFEtK840E+EU9At
	NRxQ3RsmFGJeCz3b/yMc7HA7X30X5FVXEbFhzmgnMPos2Qa9SFXesckmNAo1nbE=
X-Google-Smtp-Source: AGHT+IH2LHPE+exOtXRbhHP/aBGtBFvAdhKeIYyX3WM4qycDkcv8E0/vxduBOg23kfnXKfj2q2HsLw==
X-Received: by 2002:a05:6000:2c4:b0:33d:9c56:37f4 with SMTP id o4-20020a05600002c400b0033d9c5637f4mr5831664wry.46.1711874714173;
        Sun, 31 Mar 2024 01:45:14 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id k17-20020adff5d1000000b00341b7388dafsm8436003wrp.77.2024.03.31.01.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Mar 2024 01:45:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 31 Mar 2024 10:43:57 +0200
Subject: [PATCH v2 10/25] crypto: virtio - drop owner assignment
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240331-module-owner-virtio-v2-10-98f04bfaf46a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=855;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=BF5+L9M6rh/9q/lpIn327dnJkaSg5SfZZk5BFIHRLEw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCSJZw0wPIonCf5RhhphpdE4KueEP/htz1gull
 t1dHhV557KJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgkiWQAKCRDBN2bmhouD
 19SfD/0Xz/UhiS/Vm88+cqg+ex0ugKfv2vgcDRPTavSfKVIy4ULcTDrotZ3FBN/uOoQRRgGvlq/
 TGVzg96DYQGRVTyQJsbX9ps0uTC6EmUVSyS1ImV7M/ExqVWM9fTH+5ZmbGEiUWt0d+8oXNZwLRg
 v3mB576m/SvPmdaYkKgRFuGx0h5zWQtVd+CurcLBjn8VzzlRBlJ1/LvSxrLqUTkBEeIreWMyEat
 T4yMgMn0Z59SVugwqFdBLslHq99SQ3C5RmNZi+X0lZnksb6lkBcukYV9U142vFO8UI0IYOlu6z9
 0WfXsDbi/jwIQk9FG7EfqRDOJ7+eekIH1wrjv59jfrZP45xwFZClYfdqmScnKKl7p4QfuygBBqT
 2QT+nyq87qM/IpRuxvuoaFJ5494gF5GXRsb6xfxr5BdApOrHpGB89sXEoTZMWJ0lie/P/KbT3wU
 xIl7R1kG4z0PPbLqfca2KyWCChqlCdkLzHg5QGxY0i+3nrFXzKO9BQeG3uIj+ziStFUoIprujsb
 V1SHo/6AnpltJMfFZsZ8yglWEzIDwAo4d+xGE4veLyu5JJjyHh9m+xf0GdWE20QbgxuOUysA5tA
 +GOs2DRCsx0ymZ1i1LYuIFta4lRKJuKbo78cUP1XHG1iFrTMqGxqdxKkQ0rCvZQ/IoubRVoFtAE
 xkY+iFu75RCgtQA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

virtio core already sets the .owner, so driver does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on the first patch.
---
 drivers/crypto/virtio/virtio_crypto_core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/crypto/virtio/virtio_crypto_core.c b/drivers/crypto/virtio/virtio_crypto_core.c
index 6a67d70e7f1c..30cd040aa03b 100644
--- a/drivers/crypto/virtio/virtio_crypto_core.c
+++ b/drivers/crypto/virtio/virtio_crypto_core.c
@@ -581,7 +581,6 @@ static const struct virtio_device_id id_table[] = {
 
 static struct virtio_driver virtio_crypto_driver = {
 	.driver.name         = KBUILD_MODNAME,
-	.driver.owner        = THIS_MODULE,
 	.feature_table       = features,
 	.feature_table_size  = ARRAY_SIZE(features),
 	.id_table            = id_table,

-- 
2.34.1


