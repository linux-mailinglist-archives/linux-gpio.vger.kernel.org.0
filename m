Return-Path: <linux-gpio+bounces-21609-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6BBADA215
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Jun 2025 16:32:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 461CF16D9BD
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Jun 2025 14:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9868435942;
	Sun, 15 Jun 2025 14:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="gJ3qLYo4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749D82E11CC
	for <linux-gpio@vger.kernel.org>; Sun, 15 Jun 2025 14:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749997939; cv=none; b=Uhqay1kXv/FO+Op9UKgifsaCsFraMdPMiaQTCm9GYqJc8f/GTK97BKpieHzHhDtd/PNG0yzBY5VKqZx8GA6kftuBskKP8ibf3P+kzOGYxrjbbM0bT/C/vys+seaobIc/9g5qoygdupWGLp7U5qIas+Kf6/ucQczQOVB1lOjbDWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749997939; c=relaxed/simple;
	bh=/1Mnj8BRsec6z6HqD84vADwgxfot8IxmImwLJlUFSEM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=lcwg8pX+3iL3ZwfTvx5EXuLQKLgTXmbHeQkj4j13NUmdyQ3FAOUacHW87HXQB9mvqfr9fkAYpxrPFL9LTS6S/LTTzOPDd9CdoSE9dJICzVhrycb36Fapx453hK4ecCtCQfXiUXZfSFA2zG1vkrHvB39Nqj8lVdwAuv+FcrIt/jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=gJ3qLYo4; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-236377f00a1so31879935ad.3
        for <linux-gpio@vger.kernel.org>; Sun, 15 Jun 2025 07:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1749997936; x=1750602736; darn=vger.kernel.org;
        h=autocrypt:content-transfer-encoding:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/1Mnj8BRsec6z6HqD84vADwgxfot8IxmImwLJlUFSEM=;
        b=gJ3qLYo4/GR+Htw3P/1XxLLXhUuVpHYirpDtICkGkk4TWxggCHi1jH4cm4/YfDECVn
         XrU77CNn9K60BLfJ6WN6klKxMKtpuYj5NcVVPDcWMeRHOiJ9K09naLZte66wO9PKonq0
         XGeUe6V9nEskS/dcys2BKYP8XPZ0YP6WZLpWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749997936; x=1750602736;
        h=autocrypt:content-transfer-encoding:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/1Mnj8BRsec6z6HqD84vADwgxfot8IxmImwLJlUFSEM=;
        b=WKJM+udyQ3qVKLEXGKJ9ZF9+4YHMbPclLtbKg7eZG69OS0Bx1qxT8dLdC6/eajh7Jh
         gr6jAHRXVQv69b1oDMPtPSvRRMn+/ekurxtTM5i/qBV+xLqCPVV4ohACKL6gP/cBjytg
         EMmNZPAu3GqyLa3MCj4Ib5IpYqz26rXz8XGfCFxBRLA0ZF2Bd2dxMQhdjbiWrUaF1sOt
         A5ajK6azMa6m45T9UM5QXmgLIPFQ7+WbuGtGz7xIkK4m9CWOJ9Baq2R5sXuq9ZbHZuf2
         +HM+pDwNgg8StbWXMwv0Lf2PUtGxv1/kcmsilbYk9CgxJxqYIjSCt+/56Ss2HrbadzvS
         V8fw==
X-Forwarded-Encrypted: i=1; AJvYcCWvE4rj+hSClcUTPFgBif7emUfP+P7Qn+xlnJPXUHMtWAoJlqexYt0aTzou0rMKDNK0FFhrMcfb2heQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/G3RSfW0vZApB09QIeWLPNBSTuN1ertyZIltBhh/tmAoQHPpv
	JNP0ykIrZqoPyByaM5RUQCXP1Kgb8wpypqTwMU0fKHhFxxhlVc3xrJjlMQHZJpxbtA==
X-Gm-Gg: ASbGncvWshFIV9s5XmboltGdib+uURZe3BIgstBme7P/3pzVKPw5b71085HcGmpRiZj
	3yedhjZ1l8E2yeTyQ4uRwGY3W0jyXYKLKPBt//Ld7E4QUub3OHJJCTqeij9DM9Aw7b46o+nKynv
	WgKFruRI2bT5IpmnI4kUPd/RUxgI28PCHcj2eNxS+2ANcLPc8x7pMu4EOlcz0JcGNVGmPg5DhIt
	OckXvGPYtxptRqiB17EyEhhuetTqw5PynvoVx49yKA5VFtDtgLJ8nM0c0b8ftI/epl1A77hyweP
	+w1J0OOXbInpTAshnFp9udWLMe5Yohw8AH8ttPsNN0pHCkcsk9LCWqXPbQCytNkmfJA7dkmZyp0
	=
X-Google-Smtp-Source: AGHT+IEP2Pmx2aDmmrB6WuVIgvwZlLsRnE+dHeJ7evPdUv94cztM9x5UDutRNnWUb+CaxwS7iyTYrQ==
X-Received: by 2002:a17:903:24f:b0:234:bca7:292e with SMTP id d9443c01a7336-2366afe6223mr94975295ad.14.1749997936502;
        Sun, 15 Jun 2025 07:32:16 -0700 (PDT)
Received: from ?IPv6:::1? ([2600:8802:b00:ba1:b7de:b5ca:82a8:83f8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365e0d0bc4sm44451935ad.243.2025.06.15.07.32.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Jun 2025 07:32:15 -0700 (PDT)
Date: Sun, 15 Jun 2025 07:32:13 -0700
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: Stefan Wahren <wahrenst@gmx.net>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
CC: linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 kernel-list@raspberrypi.com, linux-gpio@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_gpio=3A_raspberrypi-exp=3A_us?=
 =?US-ASCII?Q?e_new_GPIO_line_value_setter_callbacks?=
In-Reply-To: <20250614111216.93677-1-wahrenst@gmx.net>
References: <20250614111216.93677-1-wahrenst@gmx.net>
Message-ID: <841BBEF0-70B6-4166-960B-D91A394EC9FC@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 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
 CsNI/Us=

On June 14, 2025 4:12:16 AM PDT, Stefan Wahren <wahrenst@gmx=2Enet> wrote:
>struct gpio_chip now has callbacks for setting line values that return
>an integer, allowing to indicate failures=2E Convert the driver to using
>them=2E
>
>Signed-off-by: Stefan Wahren <wahrenst@gmx=2Enet>

Reviewed-by: Florian Fainelli <florian=2Efainelli@broadcom=2Ecom>

Florian

