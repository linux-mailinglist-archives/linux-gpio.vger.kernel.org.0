Return-Path: <linux-gpio+bounces-27460-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CF716BFC4CE
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 15:53:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 67CB1581932
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 13:43:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C48A03491FB;
	Wed, 22 Oct 2025 13:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="vTrxrYAX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFAD9348884
	for <linux-gpio@vger.kernel.org>; Wed, 22 Oct 2025 13:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761140477; cv=none; b=AS3LJTS/jqLuBDnMrNv/JlBgPGaEHoxZ6/syzpE5Fyb1jLblUi0DChBbxpZ8ztxGbOxePanePhmcvQaBT5bofF6HOTK7v8LTDfNm3/ZXMobSuIHJWH8d2AwchHf44kq4dH3hhN2bzTVZlLIbVCVmlzXQ0RZhlvAxUYfDf8VclXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761140477; c=relaxed/simple;
	bh=Sk8U7a9xdIv7rhl6VfQ8bi58O5W6k5O2DuGhhUqNLGA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lP+XlOZKX3MHy3KPwe+Y3xdImXFF7ga3yjeyEZRBCFpZS6lE+i3B8p/qHBIX1tGHd3EWXPNIYfgobQqRJdf2VrdBhPFB4/ZMQ+/wcNcPUc2+bIy9i20zoCYKYtGnC3aYXBpJVD6mmLkwwC2275ay+efyZv54hvCFvQO9eVPnvOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=vTrxrYAX; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4710665e7deso27074555e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 22 Oct 2025 06:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761140474; x=1761745274; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PWPl5d9e7d+luCRqzeSP2E2W2VLVJsed8thOdmgLxEI=;
        b=vTrxrYAXLf4rnVEtMqjUzimipbTkjlgNQ6BlhDjppvNmtT0ezsLGfnoruoLBbK5L18
         bMkRqk9gzOtt3tJvVvCp5vRvPbH9K/vcXFKexr6uzDPXKp0SIW+jBSI0Tk7q35CTJcKL
         PHD+YwgxssuzBtmpnImEVtNmc8pdrurF1wOO3HGa+JzqbOKZZ+RLQ0f9O2iSc+0AJjnR
         io8hmjWyMhJg86wvofbeqW6Yk4FSvvpzfY3YnOF6jF0f96RyFTyBMOTUjBXErIMGjuJt
         z14cYQjcf/xSmknd7mHTR7QoeV+naYY0/Hr1o6CAOjrMgZPr6gZBCc89HWV7xUCe/vsn
         z5PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761140474; x=1761745274;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PWPl5d9e7d+luCRqzeSP2E2W2VLVJsed8thOdmgLxEI=;
        b=O9uYRfnL6WRhHshkiFqybc8olQReribL8h5R3UPeiyA5yrNxE5POd8xX0uaXSKcJnR
         /WuF9GBg2LZV2I6idmofxTsL7nW+4dKjmMDGQxQW/mCL+TNjyAWUpzJKjWPMd95rDyTg
         S/MJtZvP+oFvqZhLIJqcOFU2y0t4tArprqYSQw+Y3uComNlSMcSKYQDxxR9XF8w3DDq4
         aoe8lKdTPT6sWagWTGCejNmTxFKZlqL2l4/uhe+ZtRDNlC9XzObXlztBSo5pK6szH2kg
         PAAgBkzi2BBq69hC7aXVNPCbBo0/ySXiGVhUyIjukdn+M5/ed00miud9UU1+LTK5kVoW
         WJ9Q==
X-Gm-Message-State: AOJu0Yxaaf+oszBtyJZHVHTTHRKdl0sduzIjCXzqxc/X5sqHAaIB/MUB
	jqgEJsYLhPs2HVzqfX1tAtak5FhfU7TNEIXLhDnDqpk1b+x7CpqWt3saTC2/H8K8hW4=
X-Gm-Gg: ASbGncsMXoqeERaDvCzA17pQdvNjeJT4wnR6aXt+Wg1kcT06atkCJANE9vKVHhNPzLr
	jwPUazLAstUlSBAy6Q7A0iQ/H5pMXi/Ov6bKcOv1Z4QK3+3wfk3619EbmPSEF1E6Zrs9aW9zoEe
	4w21/vTBLdkN/0WuKdf+1ZHRbP6Zv+EzQvq5gdGfknjXsI3OB5Cq+RxYN69LPx4B1XgqPl9Y1Ya
	2AqVnk/kvOCxFI1AYE8ZD2E4MbkbAWXZGIzx8dMAeObsQ2wL+HUgCoO+Ocf1bwQZkPFSkbUx6Au
	ns5Op2MCui4vs0ckwUC2TuInvLFVSyih9J3r7QftaFs+0oLHuQrPYprfM5xd40Z4D7TEzXEpn5N
	ERleyE54eOXFuOM0vl5M/hEkvcET6UCQh3wUm/0YBvKCyROBMPL9OiLk96xnno4rdtPY3/x8UMI
	YV8ckMQQ==
X-Google-Smtp-Source: AGHT+IHqRn5dOzMWDgdAzafkqM+1zXTWvQMR2Q3PRRUvUZ0U039wIwEkxcI9Lkom+tXMX6XvHpd5tw==
X-Received: by 2002:a05:600c:3b05:b0:46e:32dd:1b1a with SMTP id 5b1f17b1804b1-47117874689mr162448315e9.7.1761140474135;
        Wed, 22 Oct 2025 06:41:14 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:69df:73af:f16a:eada])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f00b97f8sm24863066f8f.36.2025.10.22.06.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 06:41:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 22 Oct 2025 15:41:01 +0200
Subject: [PATCH v2 2/9] software node: increase the reference of the swnode
 by its fwnode
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-reset-gpios-swnodes-v2-2-69088530291b@linaro.org>
References: <20251022-reset-gpios-swnodes-v2-0-69088530291b@linaro.org>
In-Reply-To: <20251022-reset-gpios-swnodes-v2-0-69088530291b@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Daniel Scally <djrscally@gmail.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-acpi@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=853;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=y2MgYQ2aQCXvNHL2MhQqQnv4he+DDwnO24lH7mOa7/8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo+N7y2ybtex/HkkIo2MSMDjXUR30Tb7YHJVLsO
 /tWAKBg5DSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaPje8gAKCRARpy6gFHHX
 culPD/90V7vFeKZCxMnH5nsWa2+uShCJMqsaW3dY3Afuc9VSP0iDOOTv57zBtVzpPY7KDE6QTQl
 ir2A4aLbHDqQ+fNEqciFC0d7Y6zWFrnoiiO9Bx+5I5EJb/iObklXlLEjR5caEDOlOqtgqCncxN8
 t66dR8nx5ZmyoHjd9jz4rPWcYa1feinmdNvnmdw9PMj53VXroGNaK73zJWjZEVSgzaTZmPbdMKC
 myNqoj6LkL1n0+Bv8y/G0BDsFknxpdhCJtZOjFyEWFkuqVzjBdDdndmQkNrqHBJ8JOalba8DjaV
 pKTyxDyK/DTm5RAPJvg5Yk8Jz7afg+vKU4f93CXPSECGUaW6RY+Ao3zGj9mydMHzaLq9rFu1ge6
 yKLB4y2oQEECj9CoCFsVYaP7TH5Nbm6tOljEsUgnrlwmUjQlExmnVo9UzoMye7H+MAcKWxDOB8B
 AETv1YxvWePbpLWBTHfMplDbP8oMeiOXaKIUR9fdJWu78hAu6fVxfVJBv1gOCPkgZg9ADBnqioa
 y6c4F6cpWx131BvZah3ca1wmO6WMiQjcSab6CNhwDNOku3fIu7DnIej45BcJNJRcVGm3BXQQg4Q
 Z7nJUiOOkHNyGa79AOxAEU7tYfOB03XM9tXs/4mBLy5m9fSSP13jNtuiSJXs9cAp1VHiCffYS9p
 PS34IX8l0W19DDQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Once we allow software nodes to reference other kinds of firmware nodes,
the node in args will no longer necessarily be a software node so bump
its reference count using its fwnode interface.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/base/swnode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index 2994efaf1d5d74c82df70e7df8bddf61ba0bfd41..b7c3926b67be72671ba4e4c442b3acca80688cf7 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -554,7 +554,7 @@ software_node_get_reference_args(const struct fwnode_handle *fwnode,
 	if (!args)
 		return 0;
 
-	args->fwnode = software_node_get(refnode);
+	args->fwnode = fwnode_handle_get(refnode);
 	args->nargs = nargs;
 
 	for (i = 0; i < nargs; i++)

-- 
2.48.1


