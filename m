Return-Path: <linux-gpio+bounces-9554-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B151A9684B5
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 12:32:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 503EFB239C6
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 10:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97FBE13C9D4;
	Mon,  2 Sep 2024 10:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xc6vTKAN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A89A74063
	for <linux-gpio@vger.kernel.org>; Mon,  2 Sep 2024 10:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725273119; cv=none; b=NoAoCxTJDMLMz55jUiUzV7RKh3HOvLQP/DDgA6ewDf8PDRcyb2+UJ5pXUAHaRkhLyveu69rMvTqLsRwsAhdRNgXXydC7R6Q+LF29G0DqAiMkRVcsJrT0jc0Nj5ytgLZTFPYSg7A1PLeKJi43KeFejhRRpD7xgYZ5fi+GcyRu1vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725273119; c=relaxed/simple;
	bh=E//9i3rBC3Mu3CinKYbPASsoeyN5yH642sDsswD5CaI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WXhTsrlcMhJS7nXB3x/yRdlRqOvzhf7CK1eIA8Hz9y9JAXwQjsNOUonhcQhX3k6E3HPc6F/VcGJ7MKla4kxBnY/NiTDaR5lYuxfBirUCdkdYhJzvOnGAjHDX2WSHsBbi08pcEHZnv0rXhFiFSMMLYNeSZceC1FBWhxw/TVYifAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xc6vTKAN; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42c7856ed66so15970585e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 02 Sep 2024 03:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725273116; x=1725877916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wZz5aEve9gJnmWAIJx6ZX5ka1gAEq2augQUIkDSiEzc=;
        b=xc6vTKANzErgDRMuW5u37LDUyNV9DPtS8Ig1rfVcIeApUZ8ZNJv7rjzO7DiXCGzNM9
         X4SU6jkE13mw3xl6iZMZWbrfeUvVv3qpWJZzOBJOPn7zd0nzjw/e1xUGfzePXBbOxxN2
         ak5iQbRqvJynlVLlb6cnrbmL9cgtBfzmd3S5NVyzM8LcacqmNzfcqZEJtRtLSXMqXN15
         nHPTOWfgeJHTZwFQPxkGOlklR7j++KRsjqzk0owHY9SPiiz/+/zb5++X6uRY2dv7+PMc
         Wa0c6rIiUmGHSu9nhNJUBVv60V1TaOy8UcSWv0cNdBBeqhpy+aS/dXomTQ+54j60DYLR
         Y9RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725273116; x=1725877916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wZz5aEve9gJnmWAIJx6ZX5ka1gAEq2augQUIkDSiEzc=;
        b=cgC8OCRrA52cg/vO0uZXgN/nwqlw5R9z7SLMyT3X33OC6Edf5SjaBUQygLrRYqOskh
         /ZmndIoZREcKf6RDMPz8PLIjDCoCudpyT8dTRekVn+FvhfX0te63mm5mmzFoG+bKV3wY
         64IowGzm9fjkJWPof6KTB3OeiDUSlS276FmMYQp4dhUmZEv+rbcdyMi8t3EiYV/NvcNt
         kSAP/RoiFYhPDDHmUN2R8plWusGE3nAfF0papq6HfMBmm8u3Cr8+TALaGTdqakxbrxBz
         hZrsqHRO4iiKpW+7WLwAyENrIk+EwgGtCdAvGCAL8flID4VjYV1MBquBxwJPiXSvBM20
         RbCg==
X-Forwarded-Encrypted: i=1; AJvYcCWeiVVna1EYaIlEIgVhIuoqcZzv7aRTME9Qy6kC28KunmIi+teUWQS63zHf9O/2TV+eTOWbnVDeFkFN@vger.kernel.org
X-Gm-Message-State: AOJu0YzMNq8pEdC0Uab1JWEolEw7m5OvfbdWsM/joTwkxegvaX+Xm0Em
	GD7kM17fAMhTkM9OJIr49WV1EtsDpZDE2Ghf3ip2AuMEJFPDloMcOPROheH4bNU=
X-Google-Smtp-Source: AGHT+IFe+kSVm4VczVX0txVhurxYCvaDzKfUsg3clGmZJTp2CX77i8Kf9WevGLDkeTB1G96m7kOb8Q==
X-Received: by 2002:a05:600c:3d9a:b0:426:63ff:f763 with SMTP id 5b1f17b1804b1-42bb27bdffemr87907015e9.36.1725273115781;
        Mon, 02 Sep 2024 03:31:55 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b496:9e67:73c9:9f5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42baf1b0c18sm150196505e9.37.2024.09.02.03.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 03:31:55 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Rong Qianfeng <rongqianfeng@vivo.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	opensource.kernel@vivo.com
Subject: Re: [PATCH v1 1/2] gpio: stp-xway: Simplify using devm_clk_get_enabled()
Date: Mon,  2 Sep 2024 12:31:53 +0200
Message-ID: <172527311082.25578.2725532526030192371.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240820121651.29706-2-rongqianfeng@vivo.com>
References: <20240820121651.29706-1-rongqianfeng@vivo.com> <20240820121651.29706-2-rongqianfeng@vivo.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 20 Aug 2024 20:16:50 +0800, Rong Qianfeng wrote:
> Use devm_clk_get_enabled() simplify xway_stp_probe().
> 
> 

Applied, thanks!

[1/2] gpio: stp-xway: Simplify using devm_clk_get_enabled()
      commit: ece70e79868c75d946819db4fba095c8c96ddb32

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

