Return-Path: <linux-gpio+bounces-23490-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D77B0A776
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 17:33:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1056D171DA1
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 15:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AA702E612D;
	Fri, 18 Jul 2025 15:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X+ZjNF0Z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0B32E5B1D;
	Fri, 18 Jul 2025 15:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752852366; cv=none; b=jAO3He3EjYz+QA2OmAeIuYSVyYTQ3K3O0PHf4+hqs2p+5Db81hkHRyQ7V6GHa0ejgdgLJ8DJrdyK3b7zH+CgEZj9if32NSKZ4pmebOFJKdpxE1x0JObKE7RDQo643LRiRIMqWuPg+lOlnyqYTQljWOPnWSq62ATiw/mxDYz3eg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752852366; c=relaxed/simple;
	bh=aqzu2YQ5BXADTBRxOe8uZl+nl0L57XcXnUxXYVOmaf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hR3/YiXV79ZJIaIqY5hEDtpynUzdjxCkffb9nxXB6CJ7MttsLSzh7pZUmUmzUFe5gbYxqXYcLCKRiw+fmULMwTBCnTO6+XNKpu24yR5Htk2mu/V/rvu4xThbVvhE8195B07HoEa7lFYx+uNllVVfHH6ZZt7AEA7dParSuMhYFTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X+ZjNF0Z; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a6f2c6715fso1753942f8f.1;
        Fri, 18 Jul 2025 08:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752852362; x=1753457162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gllv4hKSr/Fki+4veRVEUIRWNQMSnyDixgo8cykWBP4=;
        b=X+ZjNF0ZgDK54WQYtKqFzG7no+2+E5MDwTKI7BYTxrXE7DIdtkTc0RzkYr9+dKRju+
         edK8qvWjVMO03IArwN00PVhSb4CUTTZWxKBNaB9njilRJcukUJJ+d/oYOoTUcrc0BqMk
         AIMTHvBuvLyBvrUwGHE1dGnNtep2AtnXUvbrCJGE4jlSY3Wsh3Q9QZQOtKFTfv9Fgtw3
         hy+CWzxQGkWTkOjj4PIbWqwDj9UE2eIiLhseKY1TTXaaZRA6bwtwBURsmhEYjHiyUF+M
         4rP7NC/pPMxpScr++bBi+J0XfGKNurrTD5XY+6/apNqXN9vqGctmQpMCWu5TDOAGZniu
         zyPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852362; x=1753457162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gllv4hKSr/Fki+4veRVEUIRWNQMSnyDixgo8cykWBP4=;
        b=gF3i6sdtTDkBVESmidwfxAux5SN9XE39NTnXvPAwYOI6HSL5+36auBirYI8YqeUiXS
         tl6mhnTLfqc7BRL93xlv/eYYEqJTnii+Kf2a0GtqwwYxaMDcgAYYWsh8mAIzp6pJhcLN
         V/wYchvU3mc9cHALWu4hF7fZIICPZpCmCmPvU3YS4IIkSW8eMX8GfSW4OsDXZj3+Ltnc
         w3s4zFhCzuNmlpScIvdemzGK8GAI/+5GidDqQxQb9OkIMMNoCjTv/qAMg5qi/kzm/3IB
         I5yr3PdHuN2pOd/TQMDRoeS7kBnjOGXwGW2l+x9eW0aXPAB8EV5Mh1eXLDBWQeT8/Z4B
         xOzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUO0qcm8dWK4JOQ4QqpKyE/FW7om3f4c9zvsIxGIqTesz9hs8kr4cocGZSMSbig7GrtWZz9ANkmXch+dPYX@vger.kernel.org, AJvYcCW1JQgN+LbbsdiGfLZw8J/31IW7Dijp/gUxFcTKKD6XxC/AU3aeqQ/ZPNYjU2dBSUb1cyRQedcI6zRU@vger.kernel.org, AJvYcCWfX5AZpAXeYWVhCUrbjp43js1IIOFfCwRuAWoUEPRJ5LLqkH8axebOwOuHe+RAXmtfpKi1GNIUrkbvBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHb9MeYACmtl/f8Tl3twgbuTiqmzVpP/U1VzFYoSAD8Q/u0uP6
	p5iJ9FA8inKhtRnM0OXuMPa6h3i+rR9mIzAwSnIjhejLYNKeEN5lN0XD
X-Gm-Gg: ASbGncv6Nlqlio0AmGkfUprH0/ZZ1xNhi6GJRHxQp55e3D6/z9ApZT2209ix8tzxntY
	TPkRvloI0vT4gzHGT8lzlsWT5UIjuL5Atm/ASiKISEZiULNdsiMVCt6w08J1immuEXudfJcKuok
	p+nSkvPI6gbA2X6CqCy4ifKMujOd5EST+6azG+xERXelZ1Qi9TrDCDa2k2DJrRjIWzc0VHw6vQY
	+3sxTOQ7ISga8b4X89xmWO9KLyR41t4m/EaNP78ku0gmGD2Q2XAKRt0zB3ByEBeQnGsQfNxxcWj
	O9lMhY5FHrgoWX+lVVIBwHCyrBSm6CZgzb4eDzvw+MGhUPf2u0DrQQFCVg3A4Izdl6Pb5c6K7MS
	gAa9r7KOL0F6/5ku0ekTDOR+nNXiiEoLI71PPo8Ew3lpv6Q==
X-Google-Smtp-Source: AGHT+IG0koCSub14mOqUfW6e8Tvqyn6CFRoCyGdB+mJuGBdWbBt+uqo8D0kUkKp6accmL+/IMAlZzg==
X-Received: by 2002:a5d:64e3:0:b0:3b4:9721:2b2d with SMTP id ffacd0b85a97d-3b60e4b8289mr10630245f8f.9.1752852361783;
        Fri, 18 Jul 2025 08:26:01 -0700 (PDT)
Received: from demon-pc.localdomain ([86.121.79.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca4893fsm2195780f8f.52.2025.07.18.08.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:26:01 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v7 21/24] arm64: defconfig: disable deprecated MAX96712 driver
Date: Fri, 18 Jul 2025 18:24:57 +0300
Message-ID: <20250718152500.2656391-22-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250718152500.2656391-1-demonsingur@gmail.com>
References: <20250718152500.2656391-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The staging MAX96712 driver will be removed as its functionality has
been moved to the MAX96724 driver which makes use of the Maxim
GMSL2/3 deserializer framework.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 arch/arm64/configs/defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 897fc686e6a91..6f4254f562da3 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1300,7 +1300,6 @@ CONFIG_GREYBUS=m
 CONFIG_GREYBUS_BEAGLEPLAY=m
 CONFIG_STAGING=y
 CONFIG_STAGING_MEDIA=y
-CONFIG_VIDEO_MAX96712=m
 CONFIG_VIDEO_MESON_VDEC=m
 CONFIG_SND_BCM2835=m
 CONFIG_CHROME_PLATFORMS=y
-- 
2.50.1


