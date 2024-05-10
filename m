Return-Path: <linux-gpio+bounces-6294-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 413A78C2656
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2024 16:07:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DEBFC1F2124F
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2024 14:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB558170839;
	Fri, 10 May 2024 14:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="VAGbDnjO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A572D12FB14
	for <linux-gpio@vger.kernel.org>; Fri, 10 May 2024 14:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715349981; cv=none; b=exPDsZo6XNnzmluvudX4ls61BIEzpz/fe6/smyDi7vxTWUGfUCB7du85kWJVMaQtb8AUFztjktAk9mABhxUjqzLeOnXjgFMhktwESj+IMp7O6ezqVhlqXxiTW53ijCrfXOrJAwoymaE5IVlhtyWvcsA+LUZsZe2UAgCoyCjOmM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715349981; c=relaxed/simple;
	bh=3vrH3H0o028E+i3JWGWAvMc6RQs4IPDuJpZHn6s8NFo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DJeBtbieba8gwMs4kVniLnwVL8+U6euBFG/EOxHg/c2gM5l7xEJjJeBb4rE3qLyWuMneu8qHncx7yeYoozXYbSP2kLli36Nj4dLEjcYwTrqf18kamIvAmbi8itmMOhh5OFg49RMeATcSpfqPlNyYceZq4uU/MhxXS0turzSKsWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=VAGbDnjO; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-34f0e55787aso1447444f8f.2
        for <linux-gpio@vger.kernel.org>; Fri, 10 May 2024 07:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1715349978; x=1715954778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oQi7BMvhKG60rFUGiXd360AqzfjgMdqrvJlRvRCCOMo=;
        b=VAGbDnjOou2c/z0xBkoi7al/mREiaFjF0IfOHzAluXx2Pc7gwAF4Bach3HUkkbJJhm
         H/JLHl9jMbDXKz03g00qIUWxnu5sPrCDECqyhZWejYud34j2Sd1J6skXEVUv5UK2vp6n
         mSgQmo/uuNNIjaS3yt09rx5iueTFncE93cJ9PSGQCHScsSlSEJPHC0c/JHyOdrq0T1al
         OSPyVCU6rmvg5hwxCTiR77kQ7dqXGn/+mgexoOAcGWjaNlgFgTtk7M7kuVp32R9OjLcb
         trJyMM67pQF5/V2Xo5US2sPZxCqRNCihlQI4K5RfXR13mC69EYR0MBCTDUhqYleULYn4
         AU3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715349978; x=1715954778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oQi7BMvhKG60rFUGiXd360AqzfjgMdqrvJlRvRCCOMo=;
        b=aTGm+fKVGuJNKwQqwxQFujBOts01Rrgm2dUnqRwT/F2T3ulPrhLm0Tt3p7+csJbrNz
         5TOr6omTrxlBtK4JGa+Y2kFxpRa4aAIf2oOi0DGJQ/PrvYgAL2BG+Zkjxmz2JCigfeNS
         OqAI9iuUAWodIgFghFpXC7VS/bs8+Yqt5Oe4ZtNxpBh7VrFwqS5aRZgbtxPLDXUBZV+I
         Vx7gM7ArVRzwhBYELT0Q8ZnRHpEk2vBeIC8gBD1ClFpJVk1WfU+mBHmVE60EplJfudTv
         c7SRWj0SIeZ/jiwWkoYk9kcnjXqDP/iU9eMu3X4owaw2t+bQD0noAyamvVHAPhrM0Gq1
         CN4Q==
X-Forwarded-Encrypted: i=1; AJvYcCX0zyPIT4YBF6XBRCZ7D7FiRCKJcT6gFZV5Je29pqmt+J6UpwnKH3409AxGzG26OUDTp7nsf2Vt+FY4j5xmpTNrNj4GS7xgTyXfCQ==
X-Gm-Message-State: AOJu0YzYPu0NirB784RO5FkHP9ZAEvPHbb4hByEa5dnxKccG5KAmtWMW
	e4GLCWC0qqcxUYIVQg8MnMA/W1WJbpEdSPWD6GBIYn30jEGixhxQubNh0jwmpUs=
X-Google-Smtp-Source: AGHT+IH1m0ioh+166tt0+TO7m0Pcg3Qvjn8XKbv4j315gWftYA9wukadlvqEapCbwIhs7MOcnvQ52A==
X-Received: by 2002:a5d:6da8:0:b0:350:f6d3:4ad4 with SMTP id ffacd0b85a97d-350f6d34b63mr1251329f8f.44.1715349977896;
        Fri, 10 May 2024 07:06:17 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:f6ed:a982:f92e:840c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502b8a780fsm4620264f8f.59.2024.05.10.07.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 07:06:17 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	brgl@bgdev.pl,
	linus.walleij@linaro.org,
	Kent Gibson <warthog618@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] gpiolib: cdev: fix uninitialised kfifo
Date: Fri, 10 May 2024 16:06:16 +0200
Message-Id: <171534996897.34114.8159265536879918834.b4-ty@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240510065342.36191-1-warthog618@gmail.com>
References: <20240510065342.36191-1-warthog618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 10 May 2024 14:53:42 +0800, Kent Gibson wrote:
> If a line is requested with debounce, and that results in debouncing
> in software, and the line is subsequently reconfigured to enable edge
> detection then the allocation of the kfifo to contain edge events is
> overlooked.  This results in events being written to and read from an
> unitialised kfifo.  Read events are returned to userspace.
> 
> Initialise the kfifo in the case where the software debounce is
> already active.
> 
> [...]

Applied, thanks!

[1/1] gpiolib: cdev: fix uninitialised kfifo
      commit: 3c1625fe5a2e0d68cd7b68156f02c1b5de09a161

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

