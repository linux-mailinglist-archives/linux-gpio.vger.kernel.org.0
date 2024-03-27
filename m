Return-Path: <linux-gpio+bounces-4712-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7007388E598
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Mar 2024 15:24:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9DB971C2CDE5
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Mar 2024 14:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E0C7157E73;
	Wed, 27 Mar 2024 12:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uWlcxziE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4537814F9C5
	for <linux-gpio@vger.kernel.org>; Wed, 27 Mar 2024 12:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711543570; cv=none; b=X1mR9ctbiG2wLS87E6XybpdvAphUZzdjjnFrtxxRwc589mrlI1ns+4tC3GpiE6nchw++3qvGDusZTdkn/10u+/qX/xXR21z9i7gGMimAXW6TaWXKVi1lmXswliu/CNEBK4wsQa+qepu2ArnJ7WvU0ec7Du2OT+8tQJMsLMqB1Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711543570; c=relaxed/simple;
	bh=PP3MFzXOn0y5/ZwEiMfjnPaChdOWdaVsrRcHCUE4yLI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=phZyRY8MD1Y5vIvFUgZ/dCgxUDUJ1rtyFtvIh+W0K9+TsVdRxjBS2v6vsTkPiReMHm1rTqBQlnDWHsc+TnC06JjRAtW6YvyL02NjKePejB0OdhW5ZLidt/9u773xo3uGQiZ/208hDe9uh4aQo7z3C41+C7nIQXNGiMnG7I1dVyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uWlcxziE; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a47385a4379so153032166b.0
        for <linux-gpio@vger.kernel.org>; Wed, 27 Mar 2024 05:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711543566; x=1712148366; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xcNHdYD3uD4iwF1+LVPcIdLIGHnCmbVJHNncy5BFB3I=;
        b=uWlcxziE/Wjh5Zfj4qXGg53NYVmYcVWVwsI8/0huXSadwmE/WEHGxsdxRkL+T+wW5r
         9hJtnMqfN0rHI+WWC9sOGrHwix7ZG4NBu98+7qrrnNcIUFlqJfOv2VzdLRHOJdyH+/pd
         MIsvr4rLhBn5/KKuR8Sk2RHRoGqtKFneQRadkIE0+nrtaimUS9sZuhBtR1CJK0TFYDct
         BBKOgrzvgmuIMvO5m9b8oJR27zHYsyFwUKisk8F+JhcJYD40i+mlrnLB0Ok3YgyZNOCB
         6eXxWkQ16fLnv80KuwfSY9x2mRlS3Si91iwioDeS2Fk68bs5+iSCU1qa4GnzOYz9FC7O
         dOUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711543566; x=1712148366;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xcNHdYD3uD4iwF1+LVPcIdLIGHnCmbVJHNncy5BFB3I=;
        b=oGxstshCu85dl2P6jLvWmLikKdNMXZhUccQm4xEjJvpuL0ga5q6WEn8qqw0S6WyMrV
         cQWwaXWsjOtwWGEbm9f0sZngouwR6nlu3g+4hZJ1xlHunRyk6WU/6E7HnzfoDTQ7aVOF
         7qocegXHTU37uDhruKbEQzSjc2R5pexbpgDWPlXeVfei62AIwNIJ09rXOjQ75JjQQQbM
         /GaOosbgCS2UrxzK2oLPaaZaaSOtnmt0RmpB96Z5F/mJK2kklfWnoFpcku0mhQnZaILq
         6boTdWtufdWBkaJJ12Ok24lT4mOQW5evVlCtR1jcRndrgVDgl2NZZwHN9lglvToYVJTf
         0MOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAfh3D8AlOQ45YQex9YUtJF+O+zsv2XA+wXWb5Y9fla6OQDlI+NhPuNzQ77JgTaqdw60/X1ib7b0UTvEwl7dyMeArn3uJWm8DrnQ==
X-Gm-Message-State: AOJu0YwetMXYG3dAasGj73FfecTp5551vhVymmws+oupz+kChQAitRNA
	v9dr1/23eRsi4V/QthPf182BAnx6gjdlIwl2zvTLBxirXmOCb2ayMGrS1KMDbV4=
X-Google-Smtp-Source: AGHT+IHAC+efJDEDOhYYZLnuKsMBiAknK86hs9hU/6w4UJOwXzt8k36t0rLL/AgWFx4eJtux97baRA==
X-Received: by 2002:a17:906:f59b:b0:a4a:3b69:66a0 with SMTP id cm27-20020a170906f59b00b00a4a3b6966a0mr4448445ejd.15.1711543563860;
        Wed, 27 Mar 2024 05:46:03 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.205])
        by smtp.gmail.com with ESMTPSA id gx16-20020a170906f1d000b00a4707ec7c34sm5379175ejb.166.2024.03.27.05.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 05:46:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 13:41:07 +0100
Subject: [PATCH 14/22] net: virtio: drop owner assignment
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-module-owner-virtio-v1-14-0feffab77d99@linaro.org>
References: <20240327-module-owner-virtio-v1-0-0feffab77d99@linaro.org>
In-Reply-To: <20240327-module-owner-virtio-v1-0-0feffab77d99@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Richard Weinberger <richard@nod.at>, 
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
 Viresh Kumar <vireshk@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, David Airlie <airlied@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>, 
 Jean-Philippe Brucker <jean-philippe@linaro.org>, 
 Joerg Roedel <joro@8bytes.org>, Alexander Graf <graf@amazon.com>, 
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=762;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=PP3MFzXOn0y5/ZwEiMfjnPaChdOWdaVsrRcHCUE4yLI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBBPmwe4wpkGjPDa9IFmmJcFy2OKytkeKyZycw
 AlSIQtS16KJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgQT5gAKCRDBN2bmhouD
 19PSD/4yYqnj7z8BE0lw7ekC4xjBS+K/SSYPbZXiZqpgBNKtouhjE+/EaLyosBVQkqSLvargvG3
 QvDJzvb+nLD+WwOT52wSDwliv/Ae6GMRPBktUiX3fy9Nh/bllS7ADKTbvP/TiLZwM7leQtI2FIs
 5IxOKcAEU8gKMzPRDjNOOPO3WnRTa7HFEdKo+w8XiIL7kDXbqw2Vrw2xNf5/PyXlwzIExznQF1g
 W+eh62On+nSjWkHoGEXv7siMDdiBirwvhQdVMblqjcqEt5iXLcJSOi1YF3fYR3Or5dKnNrFzotW
 TFCZhxdCDn6dAtcXHVgJdTmPOctZ2BbjU1yPjeSrslJTYFXeaJ3liX3KwbEavpey+KhfpASo/+J
 TZKxYxu4jdFzrf20lb6xcul2pIkjhiWbwfb1LmS49MB5yt1Fskt2SpyEJD6RboXT/rwXS4B71wP
 qHacI+KIAQM/iIDs/QZOUwZZsmZUnX4YEE7qP4x1HikiwuXVDHyPWmD+IyB7eMFi7KfG/CrJZPZ
 AaMeSmpbmQ/Fj0CY6hDkkVk1jDZoL0KmBSzdnG3Lpe75Q/Ff8KH4KrreNx4Vjgye4U3pwPbri1D
 5GO5i9hy1NoZ9fg08cBB5IjQ0jbJ2Z5q5f2VOJuPwH4FZLcJ0w9UA6H0Ctr0KCBBevGH7HtNyCD
 hiQIZRQ3pYjK6fw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

virtio core already sets the .owner, so driver does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on the first patch.
---
 drivers/net/virtio_net.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index c22d1118a133..61f680699648 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -5021,7 +5021,6 @@ static struct virtio_driver virtio_net_driver = {
 	.feature_table_legacy = features_legacy,
 	.feature_table_size_legacy = ARRAY_SIZE(features_legacy),
 	.driver.name =	KBUILD_MODNAME,
-	.driver.owner =	THIS_MODULE,
 	.id_table =	id_table,
 	.validate =	virtnet_validate,
 	.probe =	virtnet_probe,

-- 
2.34.1


