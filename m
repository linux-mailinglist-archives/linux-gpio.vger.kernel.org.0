Return-Path: <linux-gpio+bounces-3507-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 814D185BBDB
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Feb 2024 13:21:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B3DBC1C2209A
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Feb 2024 12:21:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FA5367E79;
	Tue, 20 Feb 2024 12:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="Ny2YcrX+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CA7692E0
	for <linux-gpio@vger.kernel.org>; Tue, 20 Feb 2024 12:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708431703; cv=none; b=ij0cZvI+zsx8HUvQGWDMIinkR7tPmuUokAkIyD3JGkU3wdA7saWV6dIHcPKaJfyGmEZwV5g/mBlhaMuVyEbUuI+LaWpJWzjFUnrM/ZcbI1U4EN3mwsy/mTbJEKEBRzb5W720dYH3jxwi2pdawqQDdGiAJHkz5UReI33BOza+lI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708431703; c=relaxed/simple;
	bh=j5bs0/iOOUF9Cuyj4rG6IASjedmK5NxyUi/nRDfE1RY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IF4rU1bBYtCCmzTRUpGqVSPXXCUUF4XggFeFmxAHLJgrGGj0mxi+OMlPcunoJc8XmZeawQGJzlLxp6UeUjNfCKME9lHhWxnsIXH2B/TCLs5+s8Y7B3hXSMDZIirbZgp4Xm0KPrEKo1GOToyVzgs1IanMC52wMF/ZtTEPfjqOrow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=Ny2YcrX+; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 45E3B3F642
	for <linux-gpio@vger.kernel.org>; Tue, 20 Feb 2024 12:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1708431699;
	bh=j5bs0/iOOUF9Cuyj4rG6IASjedmK5NxyUi/nRDfE1RY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=Ny2YcrX+W4tLiIFEWxJLl0FpXluI5xS8M0VMtB9GVvvqybeABImyx7OcDtIIYccJx
	 mLMPc+s3GOTIfiV7Tc01JpuxKDWqA/izBH2kXK+qh5DzeGUYEh/Q5T4SeGUaTWGYt3
	 5KZAxeSfbfVk3XI8tcZJmbB+HQgaZ4sK7Fk2Jrwxw9lnk8aX8NnIE2ATBx8T4dBA11
	 ud37ZcG2F+LL19H1kwDqbPaNwHw6LwAX2zcN0z9uMJxACNCedT01G6eoNh/+lWnskr
	 xIlWOkbWxGv+7/n6ns0sOzeyfx30oAIh9EEuyIktO0lO4pthXwZuLFbaE/LTryxWKb
	 f5B4SuA4ufYgA==
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-29954faf16dso2763549a91.1
        for <linux-gpio@vger.kernel.org>; Tue, 20 Feb 2024 04:21:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708431697; x=1709036497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j5bs0/iOOUF9Cuyj4rG6IASjedmK5NxyUi/nRDfE1RY=;
        b=gOcv2/Of1u+c3FtNJOWj9RfxI16vRiaQZTCEnHuOPhiT1TprG/jF3DHGinfbo91VPW
         JhthCOeDXnVTEaQFncVNAkGsquQyK0EJDbRT7sUltfOeGv9PhCIKFS2Y8aVXp8l3caIK
         CPW4Yl7O21R7sSGcpT+r+vl2Czndj1KZ29xJJc45RAm4a9mFYoQy+1Ub29Exvo/Yjf2e
         HE86anyDfH1P/ikOu2+0DupJEdCaHsfJEXbAKsch6uy91ra9PzSyITKDk6VXDWWrZYWj
         oI/B5KashwKDtV/YjOrD8Ra3rqREXeMr5AXk8mC0gSO61XuLhxhnmefqBNc5IblQY4r1
         XMAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjWiX2LC27BxAVFS5DpaVNunzILQZ4juBv0tdtjp/sHXutGt5gXuQump3HfNJzewrrTxjpNQiTuyU5L74TAwi3VJOc1nhM80v9ew==
X-Gm-Message-State: AOJu0YzOUmUUiHXrpKy+KWO1Pt6/rXycxycQPJxtH16UssV1Y7dJssKz
	vleNUfoEB9Qs1u85l8ta/juTt2RC9ivqvLs3e+ePuEt7PbdZVUcTx2QmZomQkCR7HuDy8tgC6Ik
	kFKJ97SX6TmTG2sWWRBPAQ9c5tV2Psnnzn9TC9rbETG01JfVszspvtfIXAN6gqhu+4+1V5PWnol
	M=
X-Received: by 2002:a17:90a:8304:b0:298:a422:937d with SMTP id h4-20020a17090a830400b00298a422937dmr18416930pjn.24.1708431697140;
        Tue, 20 Feb 2024 04:21:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGLAtc7xJSsu2a2w8NbFlepqwlXit+secKB0bdFRp/jrwC17jdRwv1LfM6a++aLJcUbSYE/Iw==
X-Received: by 2002:a17:90a:8304:b0:298:a422:937d with SMTP id h4-20020a17090a830400b00298a422937dmr18416908pjn.24.1708431696769;
        Tue, 20 Feb 2024 04:21:36 -0800 (PST)
Received: from fenrir.. ([179.108.23.66])
        by smtp.gmail.com with ESMTPSA id y7-20020a17090a644700b0029942d11f3bsm7012559pjm.3.2024.02.20.04.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 04:21:36 -0800 (PST)
From: Lincoln Wallace <lincoln.wallace@canonical.com>
To: brgl@bgdev.pl
Cc: corbet@lwn.net,
	lincoln.wallace@canonical.com,
	linus.walleij@linaro.org,
	linux-doc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: gpio: Add a note on the deprecated GPIO Testing Driver
Date: Tue, 20 Feb 2024 09:21:32 -0300
Message-Id: <20240220122132.16991-1-lincoln.wallace@canonical.com>
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

Lincoln


