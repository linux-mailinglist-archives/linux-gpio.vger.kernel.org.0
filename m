Return-Path: <linux-gpio+bounces-7842-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEAA91D920
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jul 2024 09:39:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9665B1F21C61
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jul 2024 07:39:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62A9A54765;
	Mon,  1 Jul 2024 07:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="D8IRHPW6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F8A5FB9B
	for <linux-gpio@vger.kernel.org>; Mon,  1 Jul 2024 07:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719819552; cv=none; b=JYJ39LMurDuYb9vvLP9hcLGr1gj9MZaa/jfjaRjLW/UbDH3qScPVAbp0Im5H95s9khidmvZsp2PcMDTwA/4qjPmTyNnmBwPofsvqG1/6gTm0lmNIG0ZehYLf9nPfpULdfPv6MUFvzMnyDpsror8HfLj+/GQRyPJNvtWMDSuJ08o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719819552; c=relaxed/simple;
	bh=dkYEAXIYXVQLMENqeRXWiEaGrupUhLNU8N2paeczWJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aT8b7c/GdiQqKx7hdcDgMO0VBAcEpauFRzSLgTqDKob43csAYr8ADMx+tybziHtRitG5aav5jVOf3dR5TmTi59tWpjZo289MhYQAO52YqwiUp/ZifeRc/V0ZxcbISV5KFo29lRTLQVUpdlRPjWjBMt6NbsGvWnSTCiLylPy1DWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=D8IRHPW6; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-354b722fe81so1868482f8f.3
        for <linux-gpio@vger.kernel.org>; Mon, 01 Jul 2024 00:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719819549; x=1720424349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7fgIgufC6sWYVbWr++Melz5Zaf+Cm5Y66Rpu0DCSBjw=;
        b=D8IRHPW6266MB2L5Gevthpv6l8AZb2uhApvEiT1kOEO+fMnRivnbCSpDg09QSsmQtg
         +s2BQCKPvyEcGTgD3ZuYy4N8zoqEDNHkio9yY2e2J71UJjXMDXd2aPrC98T9M8SrFju3
         OmxDXQT+tCDpqG4VEhHhz1tom0sapMjvrB9ovvLybrQoEsO2rM7pmJCk+h9I1qBL/Oj/
         X6RJZRNPGD6QHYUTvsp0ihdhXU3S4deVkt7ngtKSnb0xomjFTnhu2yRNbSrwW5USqRrl
         Cu2VIe/j9/MKMmfTawvMUufz9Tdag+8BJTtHagxigmgUJ9RrKpQl9Sohijik3HswjPyl
         XNxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719819549; x=1720424349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7fgIgufC6sWYVbWr++Melz5Zaf+Cm5Y66Rpu0DCSBjw=;
        b=nPnnNVVTSjEZF/B8qiVMyAGMNoSS15lz538pKLR/UjB8eTgHupRzpVg43GMmxkSMGR
         NyQ2WyYvMcksvHw0l3riQclG98sWlgQboQTuMsh0CPBbT2+ssVGVPgR0c39VnzB/dK6o
         lxe+5Kcsrl5KUvqHKl/EJui/OLRr/vbfhvNVgOfOkB5HGc8CSqyjka4NzBEpGHJy0Fxk
         LFItJwDDsb+JD74TpGDIh8R8QXkJ9flhdqfoircud4zyg95i0cmBxbYX/ZtFE63DFSBv
         Q9Pl5p4wYNLluS/XOKOFZa5UlsYzmX7WiNcOLcpcvLi8u6ZSTWOmM9iiCoOgzE9lF+d7
         /eLQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4jIMOSuek0BtJYcPid63SkNXOkGHAgE0Jtk5/n7mz8avHN3vbPdhw2H1Gn75cFcHZO+RCka68KpWEGqTf/lZcf8W8yzMxG2v4/g==
X-Gm-Message-State: AOJu0YxkbMhFt8rcN6ypEbjjYYqUIcRZISYzbHbLN6tufkfvN1Bxy6m5
	q1CsRdLUpFaS1X+CA8yQG+Az9wva9CmLsRYFMIx00jQZ7d/Hb9U616p5ktA3tBA=
X-Google-Smtp-Source: AGHT+IHNc+7+N9eC1OCeqWD0tq/0TARqW46iTGahOqldEck4UMOaczS4cTl8rIDye8WekS0QF9nrHw==
X-Received: by 2002:a05:6000:136f:b0:367:1da6:e419 with SMTP id ffacd0b85a97d-3677571c211mr4067290f8f.46.1719819548998;
        Mon, 01 Jul 2024 00:39:08 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:1c2d:13b2:676b:59c2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0d9ca8sm9249029f8f.43.2024.07.01.00.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 00:39:08 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	brgl@bgdev.pl,
	linus.walleij@linaro.org,
	Kent Gibson <warthog618@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 0/4] gpiolib: cdev: directionless line reconfiguration
Date: Mon,  1 Jul 2024 09:39:07 +0200
Message-ID: <171981953255.7947.3008231579681723957.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240626052925.174272-1-warthog618@gmail.com>
References: <20240626052925.174272-1-warthog618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 26 Jun 2024 13:29:21 +0800, Kent Gibson wrote:
> The behaviour of request reconfiguration without a direction flag set is
> ill-defined and badly behaved, for both uAPI v1 and v2.  I'll will refer
> to such a configuration as 'directionless' here.  That refers to the
> configuration requested, not the actual state of the line.
> 
> The configuration validation used during reconfiguration is borrowed from
> the line request operation, where, to verify the intent of the user, the
> direction must be set to in order to effect a change to the electrical
> configuration of a line. But that validation does not allow for the
> directionless case, making it possible to clear flags set previously
> without specifying the line direction.
> 
> [...]

Applied, thanks!

[3/4] Documentation: gpio: Reconfiguration with unset direction (uAPI v1)
      commit: e48fe75afa539d110753f7420aa398ef89f8e383
[4/4] Documentation: gpio: Reconfiguration with unset direction (uAPI v2)
      commit: 6a9c15083b1662a4b7b36e787272deb696d72c24

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

