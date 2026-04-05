Return-Path: <linux-gpio+bounces-34688-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ab0YMSaP0mmgYwcAu9opvQ
	(envelope-from <linux-gpio+bounces-34688-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 05 Apr 2026 18:34:46 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5801939EFD5
	for <lists+linux-gpio@lfdr.de>; Sun, 05 Apr 2026 18:34:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5F36D30022FF
	for <lists+linux-gpio@lfdr.de>; Sun,  5 Apr 2026 16:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5A3E3126B4;
	Sun,  5 Apr 2026 16:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EjWsyRgp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D65D31065B
	for <linux-gpio@vger.kernel.org>; Sun,  5 Apr 2026 16:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775406883; cv=none; b=KbD7HIS8j6DxKNOAWyuuMsH8YTlOFeKsa7j4UWXTmPw21T9jwAvQiMgfpCd7KjvQC2lFH90K1boeuAjwS5+Jye1JsONGpHniz5OD8r9Pk7AGVxzdHj7nyP1zXPMCp8C5KO3Ly50bRHUdPdaB8w5SDfaHYLk1kn32VRJTDNdziko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775406883; c=relaxed/simple;
	bh=ShIU28ywAnLhIe50H6/Hg2mhHzijFwPqKIsC5176nbg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hYanwErbFnyeXHlwq1VLORxSUxbUe90I1FW4M1/YzvuPU5rB8r912TrpQ3yZQJG+dEFlijkjCuk/ilkqvzZ6xoLPn0565S0Dgh95cQmzCRcSO0s0aYvJrkQr95aBvMDJaA7PvJV/rN+rZITrgaknwGGEJHPsaHfUBPGl5ECQm6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EjWsyRgp; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c76bc3e8de3so1167094a12.2
        for <linux-gpio@vger.kernel.org>; Sun, 05 Apr 2026 09:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775406882; x=1776011682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hsly7+smhD3XJiINoBvEMNmOhTjXHx7S3IbobJZ4UMc=;
        b=EjWsyRgpt0OEf7KLINNGwj4HsFfr627giZzp3d6u2luuzs8a4NxC+rZXbYTYmlbydr
         5BU7MN9kSn67KtSbNUojTr0ZunPqegrEjiE9wawb2A7BmtG67FLzzr/BYueXy3Jxc1F/
         suVyiEseb0Yv8KJwlJspuExSetREFSKG6EmGQZAskbM1I9aWc24OnN26WYDxfpbNTedo
         KPhowVj9Rh4ERw5jDo0jl6ANQYf4PQxeB/iv461SnNJ1Z6e9Eq55HPWqe2ny4IOzvtD9
         +sNvYx8EQByMOvIYEM7dMpqBW+YivjKjROnaFH1kMQ8l21HEeHfznjBszKFwFJVsVQsh
         u2/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775406882; x=1776011682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Hsly7+smhD3XJiINoBvEMNmOhTjXHx7S3IbobJZ4UMc=;
        b=MLIGS+4xmYygTRHFKtrrI9tMdp26whhERDqfPkbnjVs4lFkMcOsHwaJ/+ZrMfbVMg+
         em4l22gTVJ99HxFd9GKm+fltcScBAWVgZLRts68ybd+eYPs4Le99eCd2TX7ua4/ViwaZ
         EIgoYct/9TnkY/tG2CDZJ+17TVFcz4Ukcuialh4mq5aRf6YqY0LTFdCRHd1Scg1fCPD2
         jdsfdCWisnBoEcSqUBD5cFtJuCS/FHGSmKIW8GQF3CkmrOuab/Oa8T83F95QOaxfA8uk
         7X8H5xXgQPIFnYaI8d6ogQQ231vUY66fWNxCs3MHBzp4c1URDOZpXRCWBT+xJbbnV5Pn
         WVSA==
X-Forwarded-Encrypted: i=1; AJvYcCVztXT7ypzL7/ZM8mVPJzAZCiWzqnDUsIxz1qwH9Pe1NfXAAGaMkB1iDyb07efuaS81tB/04NIhLkUQ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi7fduUvWpn6UvQK4OQ9tlNazS4rHb88CxTZqPyrKUWzKqkZZL
	cTPqBuzw6B/Cb+m5vymY7AHV2XoqGeobLaCsUtxPw0x4AXSfy2ZoMKDt
X-Gm-Gg: AeBDiesOQAORbhRkRfmEPnPZaYXVdi77r3dqdhBdtEB9lf9BG7pBup0wBPqxenEyVdK
	rNy9VXmZmFcskiT1rjsHc4M8tEoUHXKovjBXOHmESn+kkwYdJb6w5W5570W6+ReUBdjtomQNLFB
	2diIUXsFBWcqR52nNxbDTqBgTfudy7ANhILnTTOvdB786KEWJ8uOLrpOOdjaln2ZFn5t8lNIH50
	F9BcnOLlqLwAFkAxHoM2ilzSBljGacNDuhmkoWgjKxKkDe82IfKtAv6HqFxjoYalfdBnT4A0KJk
	ly3i9KyiNodoL3ieS3xq9dLUm6MKvoPzQxMoAwRf10YKsoaKR56jT30E6OozH+1wxscv23V0myb
	S6OUuLqBupOXU51cCRpCMaECOG7kcNw8o8r76yPoILRb1aN4Y2BsLzOBZv9YFOdwS+MnLAc4fxi
	7b6oxs/4XSdK5mUzFuBkdZFck=
X-Received: by 2002:a05:6a20:eecc:20b0:39f:5c38:8cf9 with SMTP id adf61e73a8af0-39f5c38c5afmr2604722637.40.1775406881540;
        Sun, 05 Apr 2026 09:34:41 -0700 (PDT)
Received: from dell.. ([2406:7400:98:ade4:6ae4:fd41:84ce:ea1e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c657dfb7sm9828915a12.24.2026.04.05.09.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 09:34:40 -0700 (PDT)
From: Vasu <vasuhansalia05@gmail.com>
To: andriy.shevchenko@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	djrscally@gmail.com,
	mika.westerberg@linux.intel.com,
	Vasu Hansalia <vasuhansalia05@gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: intel: platform: Add INTC10B5 ACPI ID for Lunar Lake
Date: Sun,  5 Apr 2026 22:03:06 +0530
Message-ID: <20260405163420.16654-1-vasuhansalia05@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <adKLLO1oKOy1tjdo@ashevche-desk.local>
References: <adKLLO1oKOy1tjdo@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,linux.intel.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-34688-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vasuhansalia05@gmail.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: 5801939EFD5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Vasu Hansalia <vasuhansalia05@gmail.com>

Thank you for the clarification Andy.

Confirmed — the LJCA drivers (gpio-usbio and usb-ljca) are present
and loaded on the system:

  $ lsmod | grep -E "usbio|ljca"
  i2c_usbio    12288  0
  gpio_usbio   12288  2
  usbio        20480  2 gpio_usbio,i2c_usbio

You are correct, Patch 1 is not needed. I will drop it.

For Patch 2, I will follow stable-kernel-rules.rst to request the
backport of INT3472_GPIO_TYPE_HANDSHAKE to the Ubuntu OEM kernels.

Thank you for your patience and guidance throughout this process.

Regards,
Vasu Hansalia

