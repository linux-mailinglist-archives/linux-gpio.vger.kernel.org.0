Return-Path: <linux-gpio+bounces-28727-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B4566C6D230
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 08:34:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4BAFB3671F4
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 07:33:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0184C2E6106;
	Wed, 19 Nov 2025 07:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="hm5lqjnH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D21A3191C3
	for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 07:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763537577; cv=none; b=ohcGYBJNajESePx2kxuLgWLRHdtg9JM5rNgkHum4EmF1iKsVVpstvWXFFgRn5uEqf8f0BK8EhpmYsfokeBL0p8tjj2Xn4jf+QN40cWqUnbFHb3QgFRnmtqk0J+s2NHTHKcOD8TIWlS2miJZnfpALhp2pZzuOTzrp+JLYZ/pNjRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763537577; c=relaxed/simple;
	bh=iIaCAg2n4uiLZKSypzySDirH2/8CA0oftEiG1KcWx78=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kf68fBOC1bfV2GuE2YOJQU0Oyqiv7J7oU/Gx7Qlnfc3uNViekwFatoRGc8W72lGE/HEfDRy9UM1sBG0KXmRHyTQUaGWlyFL0sJ4D6oIVSXIu1vaBAhwwM3BBPgYpIo9H+07+rOzItqS8q9hU3NX2pkBcskE0mBtkeCEf+yb7sXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=hm5lqjnH; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42b427cda88so4522518f8f.0
        for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 23:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763537574; x=1764142374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8S8uyk8x5lQmgy/LcZ+TxSuAYAuyuUQ8Lba42CLVZPE=;
        b=hm5lqjnHfWIlSmr9AZyWxo7+jzQ0WLBllD5c5e2yFxgJ/kNOHt0eiAmQ388IdaTjUq
         I3lccmLNSst6smMrzsPR4qY/UQGJT5IDhygjZUvUjAQtB/OFcCFAdCSABznYZzTv4TbH
         FeNbFySz51utaJNGs1f4TSNvW7LtgbKzZN0hKQch7JqX8Qjkq08Kkq3gCsMHX7wlJ+iP
         3KGOiWz1jGV09LsJRxpJBD/2jeBVW3kTdmV1L4MBZe4W0Rw6SLglCKBaA2or9mXfLqGQ
         u7koMRS5khzjdKghIVQeEptwgDk2R8TuggV8RQVnET0d7VGhWseAPjU4xiELAwa0tutO
         mHvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763537574; x=1764142374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8S8uyk8x5lQmgy/LcZ+TxSuAYAuyuUQ8Lba42CLVZPE=;
        b=RJXOpPe1WZ/3qVKT6X8OZy5z8OvWxAKfzM9tEbuf5jiZTufMI6AkgK09YUa8b9Nvq4
         0e7S+d9inlncxBZs9cz3CDDNT1K7mgkXkBEIJ+ePs/SCqF1W9+x6a1vDvwL/BY7hkCiz
         75wwGeGQIBcoJeCUOGXY6lPdbMay9f83+f6wkXb0uzUjLe0x9hrwaqnxMEIxdvLGda1w
         NwcJ1MkWOucbjkmtmdLOlnUlAFQd9Kp1yuBU8ovdI0UUemZhSG8Rl2diuqZJIrRDCBBm
         jOAC5vRGJ4V75EwWENprNlAnU4FWIXHaBPKA3vwEPaGrsiu4wYNgFsVgCjZKkojZSgBY
         IWoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUJHMknJQOKWpDd4FNmqRCzcNipQHIlNg+NfEATxyyu4+EXL6uAbAb1g/NxWkYid7HSJ5laXz3D2Fv@vger.kernel.org
X-Gm-Message-State: AOJu0YyW/Dfpm+FaQ81JMiWC8ur1HKa27hlU1LIlIKSbE0n8e2G2XCDD
	SN+lVZZoo+rwktlVHhfqggo28kLJVGjj/RzpKYokfBuExTVSqe40gkpWl3+SUaJm7eE=
X-Gm-Gg: ASbGncsiCFpfoG6/grqwtXH8UGvyVTBKIdHV3xSGCKDvx/DBP34rw9OzzVBNZTVtb/k
	Hp3F7oJdWtpRnlEeF7TlFjnulPkAkT7ozUpf4cxLObTENAruAtNJI1pOUqIdaUAZzTFHua7P+RK
	6ljbJ/0gCet/lKvsFsxZ6kXQtBTn6MjSo03nprh60CwxRb90ukTwsg7/kwWoQKV+2w1OWmqZx4Z
	hKeTgRYu3RRzX6Jyu6FyYEFPcn2+WtW+iAak47fcNKW2sLX9zam2t2OPcGwcsh2Ut9ObdnZbySP
	QGFYa3naG5gi8kTxlbdBbE8XWNJ1VgyAymIBnBQCe7JNiDSOTOI43hysfJoXCz5dRB6BbCCnfZX
	VDD/4qsOMqipeLeQc9B9EXqvd/pKjTvHwSvVqDhrwE3RXoN+tdJM0pXekzcz7J9rlMf5yVxZaYa
	qpSaS8
X-Google-Smtp-Source: AGHT+IHcG8TWUKiA27u+4X1bb9QEsYLzMV3lO/gpo6Ad8Tj/AgPwU10nADJzGTL93omQNe5ofhLQbw==
X-Received: by 2002:a05:6000:2f83:b0:429:d3e9:694 with SMTP id ffacd0b85a97d-42b5932360dmr17046995f8f.5.1763537574367;
        Tue, 18 Nov 2025 23:32:54 -0800 (PST)
Received: from brgl-uxlite ([2a01:cb1d:dc:7e00:c10a:203f:120a:d2f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e7b14bsm35937283f8f.9.2025.11.18.23.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 23:32:53 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Mark Brown <broonie@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: shared: fix a NULL-pointer dereference
Date: Wed, 19 Nov 2025 08:32:52 +0100
Message-ID: <176353756753.6939.11215769221318779454.b4-ty@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251118200459.13969-1-brgl@bgdev.pl>
References: <20251118200459.13969-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 18 Nov 2025 21:04:59 +0100, Bartosz Golaszewski wrote:
> The fact that CONFIG_OF is enabled does not mean that the device tree is
> populated and that of_root points to a valid device node. Check if it's
> NULL before trying to traverse the tree.
> 
> 

Applied, thanks!

[1/1] gpio: shared: fix a NULL-pointer dereference
      https://git.kernel.org/brgl/linux/c/01be9047988d15850ca15d146c5f4aeb5de2f569

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

