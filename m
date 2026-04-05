Return-Path: <linux-gpio+bounces-34673-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJC5FzS80WmzMwcAu9opvQ
	(envelope-from <linux-gpio+bounces-34673-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 05 Apr 2026 03:34:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F2A39D05D
	for <lists+linux-gpio@lfdr.de>; Sun, 05 Apr 2026 03:34:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF53E300DE07
	for <lists+linux-gpio@lfdr.de>; Sun,  5 Apr 2026 01:34:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A11402FB084;
	Sun,  5 Apr 2026 01:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PuI52SQw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B231AA7A6
	for <linux-gpio@vger.kernel.org>; Sun,  5 Apr 2026 01:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775352878; cv=none; b=pkZ13jx+4y5faTZ7XH5sS3+EXMgZCqonNldylNP4rekyerNTdUthBYUmADH/MbQ8MxQj+3yRdXavhdUPeUbCEZHGCHLR7vhrineqHeTss49RF33n6M9pVqIgm00GDw/i3uuKom3g590XqwsVBVb1ec1vVSkBK5k6944C7S7pTDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775352878; c=relaxed/simple;
	bh=bbCEwMYOOmUt5mImHSJulgW1Lj73B+j2F83yFEj6hdY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NERoIoi27B82Ddlbwl9TwjaAlNKK8+AXH0RGe8R9w1mH+8WZ/MdzOSos0vhMCq5V7sqD9HRHXWz++ucBp0iAPqGEkLKLIMx0NCmY/3BvIxZyr5enatsCk0vdWcOoO9oL6aH0DpeiXuSGyqGnU6GjpxkFwEk38gHkE/FVGL4D5bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PuI52SQw; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c648bc907ebso2111104a12.3
        for <linux-gpio@vger.kernel.org>; Sat, 04 Apr 2026 18:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775352876; x=1775957676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bbCEwMYOOmUt5mImHSJulgW1Lj73B+j2F83yFEj6hdY=;
        b=PuI52SQwRxtbLsZrY/lDIpdGo/JdYSj9OuzmB/kFPh1Z1Vz41RZzKRtUGwrZevl1eA
         K+nmu7u4MLTSJeIcyi9tueaocjzBzt4W6Tx9jjlIcBeddKNOgjLhp8jwHTLYaNk5GDO0
         TB4/Q2gAqPFD2tPvtXCq21olHhA6O1AQZjVfk0duMJB4GDeiczcnTEQNbozbExKu3Fi9
         KEAv4ClYHjOXAfMYFKSkskAW5DQ6MrRmxs4r1jUFf8xNOhBSDdZJCf6AjQcseAD+n7ld
         WT3FBNaFIPwDXgbx1LSfe4jVBXgQXhf+baUgntSt1Jz5074chHQJHB7fVjBjkGlaZqqE
         wHlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775352876; x=1775957676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bbCEwMYOOmUt5mImHSJulgW1Lj73B+j2F83yFEj6hdY=;
        b=KYze97oMV1dUqs3aZpAto68vBbpbyzxtFD06g7Ou08makch86zGJFXPe6isO3mPpUH
         BFYwt81vBJSbLj2b58PLYTzkqygg7ctE4Net2w7OfY3n2vUTFae4YuVo4rul2LMdkfWm
         wWA296dl2JbqRU7pHXULxSiG7V9qQuyMLk85dWGw1moxmanSLqUYNt17/sK1XJ/4FEHT
         +2y3VBWZK3bynekXaQ+Ih1iBEUGQOOXExZbDPwZbA5Lz79UMG8hN0NyvdJRn5sBxisfa
         U76567Oj+mjYR7xRwwypO3GKp6vPBSrYV58n3xeLjk7CO2litGZ0Y3gXj8KTLwPQp60f
         Mu7w==
X-Forwarded-Encrypted: i=1; AJvYcCWw4vC28z3OXOxXgz5M8xkeUGUCh/RVxDnQ56vcNs95WF1oIM9ZaW9aCjbcWLX6wLJ0FgXDvW6vd6qA@vger.kernel.org
X-Gm-Message-State: AOJu0YwaLt3Jt6Sz129HySx6XggpKi0j8hyECCPe1v2Tip40j9zRQ0vH
	XOGH//fRAFWo1bNrMEMJo8ZMJA+QmLPXFTMCDTvWTv+Y3UNTMKfiuQmJ
X-Gm-Gg: AeBDiesmAhI7tQmYH6yAfzdxa26wcFsbQ6JoI3FzcNIHQ3cqN+59m637qQ1rK8cvhI+
	1KJu95V5hwZgeWEacKvJTndGL8UVpDC5clylKq1HugxnxPTyDTuVlUzb7AzbbcJLtoAQr6GBwvc
	1+2N7SXBDtPkSNeBXTzcaX1nT7bXK3MU6kKUcbfOdSwX21ipjS8FWjZh8igudsNcf7b/X+qMK5/
	xwC04cPdNNKxh36+Anb/u1rfd6j/W1kHV2W9K/ZcwvjCZsetLu7tnz/gVjZsAIYZaTdfUPT32k3
	5FejFsE6wtneLpYo8GINuLkErITBLEAB+7ObRmzPGsnZ78GGMd5tgkxkr5TAaDDIdDJquhthOyr
	4Qo7B5rtk9/B5zAxnY+5wsB7+ZyGnlONZ6WDPpRy8f0o7/1IceSbqx1hZPbspsCHMIUNbf9Qubq
	NECThjPnJUlZjx3J9p6OI=
X-Received: by 2002:a05:6a20:958e:b0:39c:2b9d:93ae with SMTP id adf61e73a8af0-39f2f1ae00dmr7515520637.60.1775352876467;
        Sat, 04 Apr 2026 18:34:36 -0700 (PDT)
Received: from dell.. ([2406:7400:98:ade4:7ae6:3380:c4:fb8c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b261b6sm11765724b3a.3.2026.04.04.18.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 18:34:36 -0700 (PDT)
From: Vasu <vasuhansalia05@gmail.com>
To: andriy.shevchenko@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	djrscally@gmail.com,
	mika.westerberg@linux.intel.com,
	Vasu Hansalia <vasuhansalia05@gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: intel: platform: Add INTC10B5 ACPI ID for Lunar Lake
Date: Sun,  5 Apr 2026 07:04:12 +0530
Message-ID: <20260405013413.31970-1-vasuhansalia05@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <adFsG9mTkoE3kIF4@ashevche-desk.local>
References: 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,linux.intel.com];
	TAGGED_FROM(0.00)[bounces-34673-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vasuhansalia05@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A4F2A39D05D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Vasu Hansalia <vasuhansalia05@gmail.com>

Thank you for the feedback Andy.

Understood - this is a BIOS bug where the firmware is not setting _CID
properly for INTC10B5. I will file a bug with Dell to get their BIOS
fixed.

Should I drop this patch entirely, or would a kernel workaround still
be acceptable with a comment noting the BIOS bug?

Regards,
Vasu Hansalia

