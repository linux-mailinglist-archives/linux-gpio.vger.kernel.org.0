Return-Path: <linux-gpio+bounces-17521-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B581CA5EDE2
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Mar 2025 09:22:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 265823AF3F5
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Mar 2025 08:22:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C708826037B;
	Thu, 13 Mar 2025 08:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0DwgKDLl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5EC01DF26F
	for <linux-gpio@vger.kernel.org>; Thu, 13 Mar 2025 08:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741854164; cv=none; b=EOqNz5uG00Ataiu4k8by+3Us9jCvSecUFUXP55/yB/uAfz9gT4lHMHI+pnO7uShXUpI4b4qVDdFV7vDH4Ac2kKZ80pF5+Gnr8Sa5IIMZWc36qLIsjxp+CSmfqOKKZ8nN5WHK0CNzd9kXGokwMwJ9vNU27wp/rfG+M3RI/VAYoQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741854164; c=relaxed/simple;
	bh=roevfcaboJD5klj7WsCkgXU6Jq0S89KotWtmZmhRAUs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cIhB5nNnONu3VxkpXscVV/4jAEgn47ayukNPjnTBGR7/NcfVkvPr8nowcKdJrrMbsTtexYsZXcooKc14BfKbahNKlzm9MLqiA1QVJ4hpYhyjNS4BB1qaix6kEK/GB2dt6IYEsRs5ArnkKXruPQwHPWDkD4v8yMKKyIWyhnd2ymY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0DwgKDLl; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4394036c0efso3607825e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 13 Mar 2025 01:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741854161; x=1742458961; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+T+RpAJc9D2B25u0R+FO9zw2HwnNzg1wTJNVWSSSFPw=;
        b=0DwgKDLlOy4q++AZodrmUhjpx6cYvkhmZl7KMOwR1TEh5Xc9KjolcJdoFGPlXmF3xK
         I/XR7F7//A1j+Q932DJdhTc+Ddy9xHviPv2OXF9nBAQIUbc7mv0k3om6Q5uRGR6v8n3V
         6hjLqXCKBcYhC9T7D6PrhPJCIvdD+j9s9yYtwGnJnIxRM0M8WujRX6hLmlG0kO48Y4oC
         78F1wpNwwgY+0KFMcfkylAahdyOGl5rj4eoihEilgINN4jHJNJR48rp5KkIMUwe09GJ7
         5GRmBK909i4yxP9fZO9gEdWQ4ZSUx4Ob82V60XDWPGtABxhJadvtVWTT2YwxWKz98QMv
         x5EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741854161; x=1742458961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+T+RpAJc9D2B25u0R+FO9zw2HwnNzg1wTJNVWSSSFPw=;
        b=WiRzZciD8Cv6un1d4SzBKKS3+HvESakqj1xOghRfTblw1AG66+DbrcmT94UQqgQjNb
         iimdGQRVr3oF6m1qC4EU3MnZLxe1zbv+no2MnMStZlZxZAS7GlNMLDpv6H7p7O+KajaP
         fW9JfmkAgTuY7BJHh1s1i2E19HfDvxKM4QEFSfOIapeIi5q1KBKVgbgggDTPP7PZMXmG
         kG+wMCUCAmvWOlRGZ10xi1buiy769T5bTtIMtng4ARMY/ejOURN8qSZZeQB6HGokDjoH
         Lve9TCi7Ecn7Ne6Ne3Lzy026+AIMkWOQB9c2mY6vvK/BwNJZH2qvsulJfKEpwMK+dJUZ
         +X3g==
X-Forwarded-Encrypted: i=1; AJvYcCVufKBk6jvrAPQjJ5OQpXBkWSqrceSo+zOqL2u8Ko/yUUbo8ZsNCd5VrYRqdRsK9kCZ0TQtfN5McqSa@vger.kernel.org
X-Gm-Message-State: AOJu0YzNyOpeX/mEFmOx2IzG3AHcf+ZLW//eC6C9wXU9Q+cj+KEVZS2x
	zNf9kdOrgzwOZ2DU9/9Z7XtyM79srYoodSGHpzh9OL9i23UpJiNWLJ7CI9Kz4Kg=
X-Gm-Gg: ASbGnct/4NyfHj06yM6gfU2GJQm3u9ir5xmFt5un2D8j5CtkAxh4CEg0sMplRgvOw/1
	6RgJY+0c0QgbwydKHdbgTeE9a9/vwuZJ04B6EbOt4B5qx+VBY4hcQBE73AP6iRCqAN7aATsCM8z
	EnCAyyZxFmBdOVgKbjczLG6+zPk8fDNOnkoCsl5dupUtSXY9dHSyphJdVSe2wkkIWzDBy/iMe6w
	mdQClF/H1sNt2VoV143SNFE+JQE/5qYHCcrZs63MuhRf3pXF5Ppmn3zYA00bvycCpspYtsb3RRq
	ww7Pd0Km0mgKqstyEaIqPErDq+4pMaAp5GQuvu5Sl2Mn
X-Google-Smtp-Source: AGHT+IGANENf8AR+NYwinlMZSpxC0TWoU2JgcYXOJ5jAv0TPahpH5AfXPu0AhsSHOn1SQih2ueUT+g==
X-Received: by 2002:a05:600c:3596:b0:43c:f8fc:f697 with SMTP id 5b1f17b1804b1-43cf8fcf8e0mr110991095e9.9.1741854160888;
        Thu, 13 Mar 2025 01:22:40 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:90f7:ca4b:a5e1:8693])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d188b12f3sm12378685e9.4.2025.03.13.01.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 01:22:39 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Vincent Fazio <vfazio@xes-inc.com>,
	Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][PATCH] doc: clarify the differences between building from git and tarballs
Date: Thu, 13 Mar 2025 09:22:38 +0100
Message-ID: <174185415640.7356.3621071692313283705.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250311140147.66484-1-brgl@bgdev.pl>
References: <20250311140147.66484-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 11 Mar 2025 15:01:47 +0100, Bartosz Golaszewski wrote:
> Several users reported having trouble understanding the "building"
> section of the docs and being confused on whether they should use
> autogen.sh or configure. Clarify these bits in the docs.
> 
> 

Applied, thanks!

[1/1] doc: clarify the differences between building from git and tarballs
      commit: 2cd1efbc5783f5daa47598c76bede5ea7e47993f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

