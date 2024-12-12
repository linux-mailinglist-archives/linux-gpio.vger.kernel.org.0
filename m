Return-Path: <linux-gpio+bounces-13819-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B73E9EE900
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 15:36:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2EE14168335
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 14:36:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8FCD21506B;
	Thu, 12 Dec 2024 14:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="NmmeqFuH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC1F215783
	for <linux-gpio@vger.kernel.org>; Thu, 12 Dec 2024 14:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734014157; cv=none; b=FrnV+n1l6F9Fu29JGn8+Mb9yohrk7sqw2AWT0dob1ct8m+SvLrVkKzJPW4PTjIdEpPHcuupksYhmqzrDl2IhcWPjxJwNSPDNHEBi5BFVCYXlPP4F8hY/7GmMT9D0gG71WA+d87Sd5AXjhhzC2RRuyfYlp0YFysC+MEjST+pV92M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734014157; c=relaxed/simple;
	bh=fjTtqKrAvX4acnwHbHY4ovMrRloOpsTPJ7biATZMxQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J+vbTMmzxu8kEkbR19KK38dY7JpoWVkEJa4QeoBd2uQwJOyU5fWc8B03JScOAeRq5YMUBb1vMUcx72Gg5q2h8glanG/K4nkMFcOOWEbSYqdghLEzAQuh3ZFXqNqOkYs39zaVDaCkSpGialRVB9yksOAW1N5oeauI0ikppOhZvio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=NmmeqFuH; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-436202dd7f6so7465265e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 12 Dec 2024 06:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1734014154; x=1734618954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z/ODN4/i7EvQHXsklm/GxE7Ly3rDa69ltqwC5a3T38E=;
        b=NmmeqFuH+a5kDwRFWPDInFBMfip5GDFV2XfwVZN7oKbrEIn4LO06OVEaUyf19wSzul
         XoIwaBuVCVqz0/tz6mb8shJiGT++Qb+8SCEp75xMsWMgh70ZB1eGLt1sZgoN3KFWFhEn
         oytqzehoGaQ8WGb4QQOwm+xVupUveCFYiR0OEHNyBl4aAna1MsCRw+OTjEzfqkSCoZY1
         4W39OAWTNtON557yYnPFEyAhOMgIA+sZuhUoF0FZCfIW8HCDUCvccosskTh3nk/CgOTB
         Yq/KRBdtjm+9UAE2KhnsH3plu8Jso0dogSpBRTVfMPicMtGFUEhCuKfm5+7Vi2/i2JbY
         miMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734014154; x=1734618954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z/ODN4/i7EvQHXsklm/GxE7Ly3rDa69ltqwC5a3T38E=;
        b=wApxP/j3Cd77939vnVRt5bE8mtP4GAq4hz5r7MpmBB2purIwCEKJJKA8YOhsmx3/M7
         u00ADt4w/QRPJ3taVUIXtf+X6GmN9iY1AVoOhKtORepf20bVB3Q4oEcd/4MTcXd/UUBZ
         rckpPVNVEX4H/0rzFwQAGVEWWbbbN4aq6z7fymoNr03fN+7GUqQwRu4UFHRptGtEBTXj
         hgON37++t8ygy7rjzerpmqot5/Y40yt2SaCmfC1xM/tIgymRJ1DrcXSaACOlgDdURF0v
         pDcvZU0vdEnHcpIrwMQMI1z56bnIpNRBu2dCk6vfmDWHQ+bvTNte6TGlYcPN1yI7sAIN
         UwtA==
X-Forwarded-Encrypted: i=1; AJvYcCWgxKhYcCtuq0CJrXJ1Ed03xE2zy4TZMbx0rfk2nGby+nzVzscm6RMZ0s6kKtPzCZKXsUByTS1ZzfgP@vger.kernel.org
X-Gm-Message-State: AOJu0YxqarqQ5dQrEmRdPEQ/SyLAlQhfu0jfGoKyxCgoSbGBPgaNBAjB
	54X43ATIsEzXUsByXKApqYQ+ZdWuCoGpXqR3bXCofNIvMseFQ+u7pU79yUuMtOe9TwNt8H+nG9+
	/
X-Gm-Gg: ASbGncunqU0M2FUTZnAq/d91ukvmAt0ywQ8hddYzydOb+Vj+8U4fgRIasJB9P0N0QDW
	Yx5WS1mgslnYhLL4LuEtLunKoy/lijRW/Hhrlecqkhlt7wMSZ0DRQaPcmaLvauHx7otRPf6tAxQ
	IaYDe+RX+NU4ZA6IggrmNQUFqbzxTt/Y8V4fcK6i42Ixha/K0Cv7QuGccA3vXObgEq76VgUyezQ
	YcgQkVui/raUsspUYOPjUE5pHInpLJ1rXD6YAmtuOEckfYCmgdMF5Z8
X-Google-Smtp-Source: AGHT+IFWa+byrM5nnyff1YeHFqwsBqfWP5sR63Akh8W+lAA1AGZrmmxIxWcyJD+Q/Ptu28W1DopkjA==
X-Received: by 2002:a05:600c:3acf:b0:434:f9e1:5cf8 with SMTP id 5b1f17b1804b1-43622883cf5mr37878885e9.31.1734014153655;
        Thu, 12 Dec 2024 06:35:53 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:11e8:e55a:1c06:3078])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38782514dc3sm4148238f8f.67.2024.12.12.06.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 06:35:53 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Vincent Fazio <vfazio@xes-inc.com>,
	Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH libgpiod v2] bindings: python: provide fileno() for Chip and LineRequest
Date: Thu, 12 Dec 2024 15:35:51 +0100
Message-ID: <173401414961.13629.11271692679073412241.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241211-python-fileno-v2-1-84c642572485@linaro.org>
References: <20241211-python-fileno-v2-1-84c642572485@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 11 Dec 2024 09:28:11 +0100, Bartosz Golaszewski wrote:
> Certain polling APIs in the standard library - most notably: the
> select() function and the poll class - allow to poll any object that
> implements the fileno() method returning the underlying file descriptor
> number.
> 
> Implement fileno() for Chip and LineRequest which allows users to do:
> 
> [...]

Applied, thanks!

[1/1] bindings: python: provide fileno() for Chip and LineRequest
      commit: 38adbae195555fae2b9d9e2a37c9507af1114757

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

