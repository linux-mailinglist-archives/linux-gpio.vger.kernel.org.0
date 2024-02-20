Return-Path: <linux-gpio+bounces-3508-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA5585BC23
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Feb 2024 13:29:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2D24BB21BE2
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Feb 2024 12:29:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2687269D2D;
	Tue, 20 Feb 2024 12:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="lwMcGTpm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6DD69D1C
	for <linux-gpio@vger.kernel.org>; Tue, 20 Feb 2024 12:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708432138; cv=none; b=tEDkc7P7/iZoaK563RR243nX+/lDMfmvgNmSdMjXoZ9qik+1IUBLVkcatLeJZ0o/qjLxc7XG5gH3wPWO+VzhvopxtEcl0/EGql65EYPNqdt3//psvQMQp/jLLCGikNd5ulIPNPK89PbE7BpM9YxOzej2SaX4eGTGn4YpTtDoPis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708432138; c=relaxed/simple;
	bh=Lqd4WYUnccIBIqbzl7+NkpSoALyemojxRPYdhyqxBFk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=djrEFAg/3Yx51iFb+vLRcVcgwfDkueS9qS7RV/3HsiaYPjR8GhJsXlgb0dcBpJVtHs7HHJUon+mTRszRzVEFHqtv7SpxD6ZJlE1oOXKwEHBFelJC9/OMIOik9MnreCKhw1C+1dhBtIjLYTq3FYAarnazECKy+h4XWNy0KJupqms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=lwMcGTpm; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 56DF43F636
	for <linux-gpio@vger.kernel.org>; Tue, 20 Feb 2024 12:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1708432134;
	bh=Lqd4WYUnccIBIqbzl7+NkpSoALyemojxRPYdhyqxBFk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=lwMcGTpmZefP9hlv8nzN/op01oN8AmR3LbENt7vhhI82aLOrLACKTb63Sr4XJ0t6g
	 dhUrb1KTX5ZvedUP8gYEvGBdr7GR5gsfEqwYimjq/UdfJColzb3CKzezjclqPYCtUz
	 gP5nNSE032HjScY2XP86CSG/lNm/7rMmxp2iDa6BuStxac+LJ3wd4JQkZodE5anj0m
	 cxmbtu843Zbbs5wGOg4LCSbverZ/W5Mr9PXQnbfdjwO2AcqC43TjqIiRTBbAZ8KQF6
	 gWJ2BfBzsddwn+rFP2EHDIOwsvHPpwinl6oWmVmiPI2maPaaOOrwQTPZBUtrSeXsun
	 iTPTbsHTh59VQ==
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-5dbddee3694so3400408a12.1
        for <linux-gpio@vger.kernel.org>; Tue, 20 Feb 2024 04:28:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708432133; x=1709036933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lqd4WYUnccIBIqbzl7+NkpSoALyemojxRPYdhyqxBFk=;
        b=ixwnYkdHrjX7Y1t3AY9Lsui8Fb1UUWvH38VtenHLtuLHW8F5AQIYQhtdh8Rd2LnN5P
         Zl0YRuFGN5uHdI1it/FTTnQHlv/pZsJXEqNXvY66vkVJg66Yf6xSeXqfQ9IDJCUTni5h
         9kjex4Zx3ATWCv1NTceTaHmtNtRpvoD6/Z5bU94oxE/8tkxiIqML2s0nnpl0GmTHWIwf
         jTGH+9omPo+0cvLwiHclhEBhadvlOacGuVU2x9/pNRDELV86uj1Q8OFOnBR5cIHbRQGY
         pv6Bc+CKTeYU0zAejRoyRnyE2Rjm9R7pdW0X/GBhGCzOLaSSjiZ7OtG0IZb16WThOzqJ
         jM4g==
X-Forwarded-Encrypted: i=1; AJvYcCWWOrij6fCW2/Z1KS7Nx7JfBp8eB+PtPzOm5DIOIpGu2ukdsmUF3Q1cgdM9jx+0zNGgu3PyADLK3e3mhnuCW5BjSWXPZ0eOyL5cjQ==
X-Gm-Message-State: AOJu0Yzsa7Nkkbpl80Snf4cLUzWunTEKcCYCq51y1itXjsv6zWC6gsEx
	XPzOwHPEbPDev9Lloc1ZSudRzXMis2KmxurR0Ay9TjK6O/Zhtq2SbykRomRVo2U3kCszd91akFi
	vh9SVIEmTxoqydshsyGl7Lg2Ks6HSXmkl+pjMrBli+yHyLUX/JvQo/iX52o9h3SZY8P7lXdSFaP
	4=
X-Received: by 2002:a05:6a21:3a85:b0:19e:a9c2:e0cb with SMTP id zv5-20020a056a213a8500b0019ea9c2e0cbmr22090878pzb.25.1708432132998;
        Tue, 20 Feb 2024 04:28:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE97B84Uq2UpG+abN/I+MwlHDTBfcdhI2z2qjsMLJLhpJVYV244lzq4DKO4QzS2xoZVv0hL4w==
X-Received: by 2002:a05:6a21:3a85:b0:19e:a9c2:e0cb with SMTP id zv5-20020a056a213a8500b0019ea9c2e0cbmr22090858pzb.25.1708432132712;
        Tue, 20 Feb 2024 04:28:52 -0800 (PST)
Received: from fenrir.. ([179.108.23.66])
        by smtp.gmail.com with ESMTPSA id u20-20020a056a00099400b006e47300e4edsm2456787pfg.183.2024.02.20.04.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 04:28:52 -0800 (PST)
From: Lincoln Wallace <lincoln.wallace@canonical.com>
To: brgl@bgdev.pl
Cc: corbet@lwn.net,
	lincoln.wallace@canonical.com,
	linus.walleij@linaro.org,
	linux-doc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: gpio: Add a note on the deprecated GPIO Testing Driver
Date: Tue, 20 Feb 2024 09:28:48 -0300
Message-Id: <20240220122848.17864-1-lincoln.wallace@canonical.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <CAMRc=MdoUuOLTYHu99+c_AVhnDZ5LkKHkYJ0D681fcJV_aW2Ng@mail.gmail.com>
References: <CAMRc=MdoUuOLTYHu99+c_AVhnDZ5LkKHkYJ0D681fcJV_aW2Ng@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sorry, please ignore my last reply.

But okay, thank you for letting me know, and thanks for your time.

Lincoln


