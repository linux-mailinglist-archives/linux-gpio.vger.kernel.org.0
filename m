Return-Path: <linux-gpio+bounces-34683-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNlyFA4r0mnjTwcAu9opvQ
	(envelope-from <linux-gpio+bounces-34683-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 05 Apr 2026 11:27:42 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD2C39DF9B
	for <lists+linux-gpio@lfdr.de>; Sun, 05 Apr 2026 11:27:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C101B30034A4
	for <lists+linux-gpio@lfdr.de>; Sun,  5 Apr 2026 09:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0BF536EA9E;
	Sun,  5 Apr 2026 09:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cJmb2weU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A545F30F548
	for <linux-gpio@vger.kernel.org>; Sun,  5 Apr 2026 09:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775381253; cv=none; b=JZT5VIxXfAl1Wik1LcGNJpk/3sIOGvMfH1pLuJHP6ixah3cu7zugsGcHEl+pKwjAvEi+OAYlipEaCk4aC0Qerb2y515Wupnet3pOsqa4/XJws6SNIJI3PhyZYRV7v4wJxF2VZhepy1QsZCPwv9B5yoe42Kxr1t2o9p1SeBI64tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775381253; c=relaxed/simple;
	bh=R4JHJOpcZ3k5Uofec7kARlSA2Tji4pJsIxwT1H/DBII=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hxFH6rW5syxW/YPfHMDjoJbYK8eKbhjflqhObjgOUsUdhX/xiNgQ3jby7O8+UPQQ1R48tpPQdF2rCBSY4aH2qIKI4oX9Ur5lyTbfzXZiAHlAn2PHJOLC7zEjccw6IFZUbNx3V18ZNzCe+I9IVmRJbLPJTf41U1z1Hj3SwCKRkKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cJmb2weU; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-82c68339cf0so2264198b3a.0
        for <linux-gpio@vger.kernel.org>; Sun, 05 Apr 2026 02:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775381252; x=1775986052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R4JHJOpcZ3k5Uofec7kARlSA2Tji4pJsIxwT1H/DBII=;
        b=cJmb2weUoFWB/fI+GRJd1GzXTCaJ+9wjbvTr5TULpNt55Zssd3mWQ+0gk52IqVHmlj
         2EMnl3JHvePTnLV+h7V3Ez8XYdvMgqTmMQ1vkWs1/fdJfXLsKOzaCUphidaIgeyrqXTw
         PiHMaSAazJg6yDbi+NF6XdMwdRcLYGILKLPyESpKYlGePkrVaOAzDcuHZgb6cqQY8eOx
         PNYx4Z6HijLpXQ9nFQo1ocykVOhaJPk2xo8dsUHnhSTN0m4m0OZY7EH3ZN8LM8XecNCy
         JypsMt2n4PEev69oM2g9QeUCthL3ckzn97G0hKcmtvILoO3yMCdoIInzi3mRdrnwN7pw
         0xpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775381252; x=1775986052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R4JHJOpcZ3k5Uofec7kARlSA2Tji4pJsIxwT1H/DBII=;
        b=K25Yj6Bns+gp7QNSSUaCqbBp1tKP6sbExRDPp7mrum0Cgh+xGSPVlUOOGybB6tqsKa
         ThOem3NRrAbtpg/Ukv0EBsSr/6Q50e0rZg/ynZkZ0kCaJjxnKHzLUfo9C+hRtW562M0q
         bE754s2GkzKqJKDzLFb4VmuEken2658G5xNtmrHpwxOfDhPTUnUQeiLI2ow1+yRunizC
         iTa9wmlZKPIeosEG9gwf5uugj819Hx5jY8Y7VOW1P53meAyt2YOUsiM1JeXwUrZEt6U5
         MEgWdj0AxqQErmMPC2JXDc8B66z4r9Jpn5AGRjCcaf6e3HI6H1FC9gb/JJ6yvrh8EnTR
         sf4w==
X-Forwarded-Encrypted: i=1; AJvYcCUCfgfLOxx1D2i+eOlWzvphgomf9E944ubHtHVcXtDRH39Fu7xrgkxDI2WWZfKDI46bkMJMbxkjLPFz@vger.kernel.org
X-Gm-Message-State: AOJu0YzI/0NPTmnEx2ibs2GJZNUOj9sDIz0JyLdqSiHRJe1iVSR+BMVK
	B9YPBCjGiF97jGxn2CDEyg5a0bqNdNpx6LA95UD6QHASZg6FzKihxOxp
X-Gm-Gg: AeBDievituAhVVBGaEUzPLLpPC2Rga+2jNBueOna+ntIqe8pp7r8Lq9Hs/nPbFz+Btt
	ij2+3MKy5ISqgBrqO2qyDrxAQqlJRPHAb1Pvi4edYiv+hlSQErn/F9e9ftUE0XP9z32+CAZMFut
	0/ICy1kejy+nV28ZMheBB49H4XRZZQcWzMnO3iUVUkkJysUqk15pRS/06Nd71UH9JaVvFiXtbYb
	eticE4LYNfgU3v7897CwDstrCfxhSHLJota7X13mLyj+ZM1y93mVctMgiIrlA+6SLQHp9/Dpz5C
	s1QIOCES2zjDbd+iAAsVGbZ9ysZfkh8HOWwhFJtywe4NDlK5kBW9DyuwVqh/5yvwxULS8TbJK2+
	ZKy8RTRQGt6jR37L/VMvjgS95EVnRSWUVEqRtupgeaA3NHyuRbKsmtKHmUI1KdjhjeY0OaL7N9q
	0DXHmRpwPGuVjzs/ClvpU4htI=
X-Received: by 2002:a05:6a00:4005:b0:827:2c6b:897f with SMTP id d2e1a72fcca58-82d00235695mr10083046b3a.9.1775381252045;
        Sun, 05 Apr 2026 02:27:32 -0700 (PDT)
Received: from dell.. ([2406:7400:98:ade4:d639:9368:51aa:bf9c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9ca14b3sm12324396b3a.54.2026.04.05.02.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 02:27:31 -0700 (PDT)
From: Vasu <vasuhansalia05@gmail.com>
To: andriy.shevchenko@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	djrscally@gmail.com,
	mika.westerberg@linux.intel.com,
	Vasu Hansalia <vasuhansalia05@gmail.com>
Subject: Re: [PATCH 2/2] platform/x86: int3472: Handle GPIO types 0x02 and 0x12 for Lunar Lake
Date: Sun,  5 Apr 2026 14:57:14 +0530
Message-ID: <20260405092714.6203-1-vasuhansalia05@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <adIk5GhZ9ZXj1kt9@ashevche-desk.local>
References: <adIk5GhZ9ZXj1kt9@ashevche-desk.local>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,linux.intel.com];
	TAGGED_FROM(0.00)[bounces-34683-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4AD2C39DF9B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Vasu Hansalia <vasuhansalia05@gmail.com>

After checking the mainline kernel source, I found that
INT3472_GPIO_TYPE_HANDSHAKE (0x12) is already defined and fully
handled in mainline. So no v2 patch is needed for mainline.

The fix just needs to be backported to the Ubuntu OEM kernels
(6.11-oem, 6.17-oem) where affected users are running Ubuntu 24.04.

Should I send a backport request to the Ubuntu kernel team, or is
there another process you would recommend?

Regards,
Vasu Hansalia

