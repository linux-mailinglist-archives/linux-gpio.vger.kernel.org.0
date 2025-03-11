Return-Path: <linux-gpio+bounces-17424-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B93FA5C18E
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 13:43:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 213921896614
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 12:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBF6D2571A4;
	Tue, 11 Mar 2025 12:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=maquefel.me header.i=@maquefel.me header.b="CL3bqRyH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from forward101a.mail.yandex.net (forward101a.mail.yandex.net [178.154.239.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0A01EB5D8
	for <linux-gpio@vger.kernel.org>; Tue, 11 Mar 2025 12:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741696815; cv=none; b=f67wZvYNkS9rA9+ggFv0Zz1cO/WY/9aFf9uDNnuIdNhgWfUiHetNWxCYI6prR3+a5oO0ZEQOT6sPqJBc0T7ab6fVBbO2057G3iv1bEf10VDPm/J3EGQ1Ww5D5uRILUogi45Fw0F58oG4Vl2g7odklEaBj3KMh9Hf/LNzP4DYzmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741696815; c=relaxed/simple;
	bh=WCCHLLzz1h8t189HjD7MRcPtoJkZ+Ue6HJ/9yXMkTms=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=Q+lDdczvqQjgHLdU1FPLBWSDuPkpVK8+vusOA4L96apmNxQmQbf5amQCSQQQF2bmENjHvdHf2WaPX0U4+55tyVpUJFQtYmKRUVa4IXrX2K9tZPxyJichivky4Kiwqf8ofj76RqTMIKAkvYQYmMJjL3tS62InNQ+1pAo5Xgc59OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=maquefel.me; spf=pass smtp.mailfrom=maquefel.me; dkim=pass (1024-bit key) header.d=maquefel.me header.i=@maquefel.me header.b=CL3bqRyH; arc=none smtp.client-ip=178.154.239.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=maquefel.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=maquefel.me
Received: from mail-nwsmtp-smtp-production-main-95.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-95.vla.yp-c.yandex.net [IPv6:2a02:6b8:c1f:644d:0:640:2ef6:0])
	by forward101a.mail.yandex.net (Yandex) with ESMTPS id 5526D60AB8;
	Tue, 11 Mar 2025 15:40:01 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-95.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id xdp9GDFLkSw0-TMd6S7pz;
	Tue, 11 Mar 2025 15:40:00 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail;
	t=1741696800; bh=WCCHLLzz1h8t189HjD7MRcPtoJkZ+Ue6HJ/9yXMkTms=;
	h=Date:Cc:To:From:Subject:Message-ID;
	b=CL3bqRyHNQ+ZIMsdMVYmmshBXjTBM0KrMoU9mfwg8eSd9emrFhiWv3YSuZ5Ol7rYg
	 ulE+VZNZgwg2V4Lgg2bnNwwISZ+y2sShgKXJRtelk34eRwGBvVF6hIxsfG+1ZdR5VZ
	 JTvWFESb01PkfJhxiqzw6MDI8YYpshiHC019NtJ0=
Authentication-Results: mail-nwsmtp-smtp-production-main-95.vla.yp-c.yandex.net; dkim=pass header.i=@maquefel.me
Message-ID: <3cd0fe0ff42a751fd0738dacf16badcaa8ff51fb.camel@maquefel.me>
Subject: Question about ASPEED GPIO value/direction set order
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@codeconstruct.com.au>
Cc: linux-gpio@vger.kernel.org
Date: Tue, 11 Mar 2025 15:40:02 +0300
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Joel and Andrew !

I am observing "strange" behaviour when pin direction is set AFTER the
value itself:

```
aspeed_gpio_dir_out:

__aspeed_gpio_set(gc, offset, val);
gpio->config->llops->reg_bit_set(gpio, offset, reg_dir, 1);
```

Is this as intended ?

---

Yours.

