Return-Path: <linux-gpio+bounces-7699-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6A5917829
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 07:30:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D3E3CB2212D
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 05:30:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6C4E14601F;
	Wed, 26 Jun 2024 05:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IPuQ8RLG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380D4143882;
	Wed, 26 Jun 2024 05:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719379820; cv=none; b=p7lHDsKU+iaOTbMCJzMmdZURrbGoOu5ihKLVuqu3/atzOqV4cYrrKptwIkJB3ipjOsw8WSjKDfx7nNpdEyDP4GmJNSDqJ5LQ6nOhZsC+tqI/QoO4kpt1nW/VwzqofnDHeMpjSJqH5MAeQwlCVfmTR5tMRnElNwKFvsolSFd1sGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719379820; c=relaxed/simple;
	bh=pyTNIJ/mfCiFyk/9v2xchwhFP5IkP0waEl+KVnxzSa8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JRLLYae1Prvfd/+bbt4Yx+e4hwyT3Il4fT8VpbiEfFlEzzYVcognWXXvQv8c6qpynxBU4G1SOW5lPt6WjQAQ6NSxQbh4W4urBMo4keq/A4PDGRjlfiD3FbnKmJka/XojJGicyapB+eii9f1v1uEvf2oCCaND6JUDbZJwVK4BYt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IPuQ8RLG; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3c9c36db8eeso3276516b6e.0;
        Tue, 25 Jun 2024 22:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719379818; x=1719984618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FXS4AAOZJR0UaGbdrhIdaIzZL1JDPw0J2iPwwadrXKo=;
        b=IPuQ8RLGwiGVysV5t7o8tKeyJBdchGlnRndJFOX9JBn0+/UzljcZIGiNklGNo9Ii0l
         n1vgqjox1k9wQSKOqIYa28OGKdWcMHGts9dzxQVIvcKiR02tKfSwKFrcJpfaAKKRog07
         reA414WabVtUTsOnnFxMpbTm1npjmTyRvh4WfsE5b2fTl0GIADXTKJOvN3kAsoHF12UD
         hhXFdognEfLDAGwVATZK0BMG4hDaiZm3xJKlf5KjuedwuAmYq+76JML+L3aWZPstZp2c
         yhGYsgW2iYJ6dFclz2OFliy2fBTnQMVcxEDtVOl8e7FasiJQu5F8wmE9O8+P1ISIgrUT
         qTfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719379818; x=1719984618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FXS4AAOZJR0UaGbdrhIdaIzZL1JDPw0J2iPwwadrXKo=;
        b=o6mRpj8C06slTH0p68cxf+RIzqkC5lrfwryCMpQm7gb1SDKqHhrIi7rOrBeFPhGz3l
         t8iqNqxHQ9JJYhgvSzmxz26Buv6zA+jsyPuGEm7D8CVTh+tOPqTdbi+odpiJub81g0z7
         hANeRyD93banzNmasiF6iegHwj5E6iqqfue9Tee++SYISuwGwe7YAZanptugbNWJCtXJ
         akeATHdUuJHjxBHZXa2i6NqfkN0w4VMrYCqwAVq2aTAmRd5mRIpr3TDWN7OHSEZ+lw3B
         9DSEHEn+IDjE2TJ9dqzZqA1NRYtzM7EEl0tA/fjN6s1eB7bhQz5z0Ev284HCyEc89IKd
         h20g==
X-Forwarded-Encrypted: i=1; AJvYcCWqv/+k5NqISIQIY/+11QQuHCE4cZqOruWnHFZpHcqHZZYQGZjqYalCRAQXHNXs8nM2XVuD0NhJARwThNJDrJHcbiBcsLQCIng70pj8cV8C0ZETolq+Z2He6bM7nxL9tY4tvmpSFA==
X-Gm-Message-State: AOJu0YxEXDviWPfFhpAs7Sx3lFQupxZgwX/RFvLJSFuQ3APx0r+l1ISw
	jm0+GAYBFcRbwvJ9zgCsKCRvQ3TaTB+J2ZoAFaJHe9nw1oizjBvibD8Slw==
X-Google-Smtp-Source: AGHT+IF2iZNXFdcMiu4tlPNcyAV5+W33UIG2SffQvkLk1L62EqF/fM2Z2RIwnkLgqahPRwiqq+Lpqw==
X-Received: by 2002:a05:6870:46a1:b0:258:359f:6a95 with SMTP id 586e51a60fabf-25d06e28f37mr11132845fac.38.1719379817949;
        Tue, 25 Jun 2024 22:30:17 -0700 (PDT)
Received: from rigel.home.arpa ([118.209.204.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70661b9f2f6sm7804000b3a.187.2024.06.25.22.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 22:30:17 -0700 (PDT)
From: Kent Gibson <warthog618@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	brgl@bgdev.pl,
	linus.walleij@linaro.org
Cc: Kent Gibson <warthog618@gmail.com>,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH 4/4] Documentation: gpio: Reconfiguration with unset direction (uAPI v2)
Date: Wed, 26 Jun 2024 13:29:25 +0800
Message-Id: <20240626052925.174272-5-warthog618@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240626052925.174272-1-warthog618@gmail.com>
References: <20240626052925.174272-1-warthog618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update description of reconfiguration rules, adding requirement that a
direction flag be set to enable changing configuration for a line.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 .../userspace-api/gpio/gpio-v2-line-set-config-ioctl.rst   | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/gpio/gpio-v2-line-set-config-ioctl.rst b/Documentation/userspace-api/gpio/gpio-v2-line-set-config-ioctl.rst
index 9b942a8a53ca..cfaab801556c 100644
--- a/Documentation/userspace-api/gpio/gpio-v2-line-set-config-ioctl.rst
+++ b/Documentation/userspace-api/gpio/gpio-v2-line-set-config-ioctl.rst
@@ -35,11 +35,14 @@ Description
 Update the configuration of previously requested lines, without releasing the
 line or introducing potential glitches.
 
-The new configuration must specify the configuration of all requested lines.
+The new configuration must specify a configuration for all requested lines.
 
 The same :ref:`gpio-v2-get-line-config-rules` and
 :ref:`gpio-v2-get-line-config-support` that apply when requesting the lines
-also apply when updating the line configuration.
+also apply when updating the line configuration, with the additional
+restriction that a direction flag must be set to enable reconfiguration.
+If no direction flag is set in the configuration for a given line then the
+configuration for that line is left unchanged.
 
 The motivating use case for this command is changing direction of
 bi-directional lines between input and output, but it may also be used to
-- 
2.39.2


