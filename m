Return-Path: <linux-gpio+bounces-13056-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 585139CFF97
	for <lists+linux-gpio@lfdr.de>; Sat, 16 Nov 2024 16:40:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DFA2CB23569
	for <lists+linux-gpio@lfdr.de>; Sat, 16 Nov 2024 15:40:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3311B42A97;
	Sat, 16 Nov 2024 15:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c7obiWsV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37AB7E105
	for <linux-gpio@vger.kernel.org>; Sat, 16 Nov 2024 15:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731771632; cv=none; b=iuZ3ZxxYN4Ts8LGcyCmnCu4oDFEpuTMtwV3Tnl8aO5g4rk8hQ+WTbXxPbpykm4Jeu0BOj56TnW2KwCWiU7fCmyWOFEtxZkG+4H7UD8c783w1hBIYqJEoLMbkLU0bECejQczPg7UAhgZ/pqCAsqRQDJWzRQPac7cKpJi+dcZx1iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731771632; c=relaxed/simple;
	bh=Wd+7kLQISUZlzyPvYmSUTVOb8NV4Vyd3OpsFXw6X7a0=;
	h=From:Message-ID:To:Subject:Date:MIME-Version:Content-Type; b=hDo9vyTPJaA0ApySLmATr5lZ/G5XUhHEQViOZLuobLF3Z6pDtVJ+z7L6ph2FSdEk76hzR7iQh7UXLU2/y2jtpcss8tC8IOgeAHmogBVPbtD0QDlr8L/tS+pzgNkwBGx0RCJq9dW1AXwi0VHy+dZc4VeQaZEztYMGwmxIqMF2DUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c7obiWsV; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2e3010478e6so488093a91.1
        for <linux-gpio@vger.kernel.org>; Sat, 16 Nov 2024 07:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731771629; x=1732376429; darn=vger.kernel.org;
        h=mime-version:date:subject:to:reply-to:message-id:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XHEOkgJ64rwJ+cv0sVIqPUmbc8l+iTifR7HzGzNced0=;
        b=c7obiWsVvUL0o1EbiEtn7xT6Ioru6i+SAKFKzyTl1fUQn+hqGTvM9he60Z7sqT/kJV
         MnFMGMZFhs7dQBJX42nD0B/2v2BYWg6aUCFgMcu4ABGNtuvgmg3KpT6dc1fPNOTzG4K+
         ho0+kiAk+0DrE2aMANNXE7KLAl7h5iDlYoy0iHHgNHrDUWDSGmPWbAQhQ1cbRxXMZ9hp
         G8UXH7MHieRPsiBQy0KqVUIZjXZrT0qzWphs/OTS5dEJ65n9B3Y+gnJuo/KImcKLObQf
         Ze2OP62uoF9CnMPUWCS7bmGx4ompq8YJQuOBsbelEgFl9qmhFSOOGNQpzJVSD3mlL7lN
         hv5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731771629; x=1732376429;
        h=mime-version:date:subject:to:reply-to:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XHEOkgJ64rwJ+cv0sVIqPUmbc8l+iTifR7HzGzNced0=;
        b=lf6zZU/LhxURD1AmVZ8/eebK8Q7//1HRwLVAFyDZpHa+kpm8GCpw+VWsYG2pKeCptv
         35TjKeX/szMFWpvbJovHR0OUNRBaHar6ecaRgaVAwNw2+SWYxv7PJAllAgCkTN3axnjc
         gECzpNRGFCVnIau/JbZFXsSsJXa+AuA3TRv65vZYSnOV5SZhOfCRBRJJOYEwsjlApd1w
         eUAO868KeXZLxdn/WEvtF2WPNpus8f9Beqgq6jpfW0jDI8jph9b3Pkmw3xkeE3dDqylp
         TCFqjkF5zw/yrtIHnB81Gi37GwufDdbHy5LAhuxcX1FiVG9L3L56u44AoFbJRxHUBiGA
         brog==
X-Gm-Message-State: AOJu0Yz4D0iAFixtyjDfOIOnvV4z9V5IW6gWQ8lbagRmTB26AkO1iiQL
	Cr/1Rps/AWBHICLShwSglfe0vVFw3sEk6Zlug38MTQBg0mhKsnBJTe87+w==
X-Google-Smtp-Source: AGHT+IGL6PeeqlxFLtMk85lBlCjhv5Dzpr6xb5fNy+cvmuJw7INr9kHXYWkU42QQY9zpXkluYw/y1A==
X-Received: by 2002:a17:90b:5104:b0:2ea:4578:46cf with SMTP id 98e67ed59e1d1-2ea45787891mr1728004a91.30.1731771629527;
        Sat, 16 Nov 2024 07:40:29 -0800 (PST)
Received: from [103.67.163.162] ([103.67.163.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ea024c06fbsm4677170a91.43.2024.11.16.07.40.28
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 16 Nov 2024 07:40:28 -0800 (PST)
From: "Van. HR" <loneimtiyazahmad99@gmail.com>
X-Google-Original-From: "Van. HR" <infodesk@information.com>
Message-ID: <0adf78ff24f8074c89daac667ce89dbe09645c06f891952d48b407ebd2727246@mx.google.com>
Reply-To: dirofdptvancollin@gmail.com
To: linux-gpio@vger.kernel.org
Subject: Nov:16:24
Date: Sat, 16 Nov 2024 10:40:26 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

Hello,
I am a private investment consultant representing the interest of a multinational  conglomerate that wishes to place funds into a trust management portfolio.

Please indicate your interest for additional information.

Regards,

Van Collin.


