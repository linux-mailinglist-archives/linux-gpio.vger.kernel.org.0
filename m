Return-Path: <linux-gpio+bounces-31301-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGHCL7dte2mMEgIAu9opvQ
	(envelope-from <linux-gpio+bounces-31301-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 15:24:55 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2688FB0E42
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 15:24:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D708300CC23
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 14:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98B8D2D0617;
	Thu, 29 Jan 2026 14:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VEM5jh69"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217BE296BC1
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 14:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769696692; cv=pass; b=k+9GlHsC7N90Yxu6rQ3M6xINJeM1hDYWTGSv8boFAjKym2/6uGNdbK/pZkqsgPDg59hEGBwuSFmWCAmbnde+dC49x/12Bo2ruXx0md+cQYXarMRRvTDHdY8a4KYpURCbbftcJPqMVy1l0pW/gS7NWBKmX5bZmWFBPFbFDN4NXW0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769696692; c=relaxed/simple;
	bh=s7FuwPAg0PCi+deLDW0+dXgNLEqBVmStAJMhA+lbZ8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aMVD2Rq/rqrE+JlxvMMEdaZTajFOW3Aqpx6jf52ogkzBdYO1964xQ8wnd5nPhRTzhbs/m6VI/enegI4jLWeJexpJ0YoC7pf5K4kXqDOt/RHnBb9QIlTGLEzNY5yXysr3iKaC7jADEjm8cZn1V8fupMSVsn+Av8/f1fxBpqNCWJo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VEM5jh69; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b885e8c679bso171095966b.1
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 06:24:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769696689; cv=none;
        d=google.com; s=arc-20240605;
        b=Vr0t5QpGNMdSFI17W0dQ0t4HyWzaVQnKhuP95uXhl31XfACKh3iNHCZdZbmqdR+ELt
         9BkL9r79aHFVsPvPJxfgZGQUftT+yyg2wtVcrWiiqHOz+5sBOyE8+2Pfk3FXUo3mkCNJ
         TQDTciqjL3Dliiviec2mi7DkwlfJY/SLFM6YnEQo5TJ4pZNUNDouRycH5PT0SxgUtKSA
         MKzAfrKAsgw9gm4eDfvxrwTkutKkf/VZyZZwFmRo7clv3ATLhLlOghSDz+IcV0c+gj2l
         /YXQTMqk3WtHwlFX+lglF1z89/PsutLiI5TV+TFDNvcTAnn6AmtEKj/MiHz6CjK0PLO6
         stuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s7FuwPAg0PCi+deLDW0+dXgNLEqBVmStAJMhA+lbZ8A=;
        fh=+Bu4TBdRcUVUyB18bifJW4f4zLCINTbvxivj0A4OQOI=;
        b=YF841b4+SVZ5L82VCq1z4Bo6HxZ5i3am57sfBARJdFRrR0OVdQ+/Aa4bg/Xry6y7ut
         dLOPtJZuUR3jFIugpee+jbaWQWTGHQQSoytUEzyW8rvVc6TuDE/CP55gjo14DSBJAd1d
         ViCGA2UqbSo/t23fLpgk4d1+9wSFKabqW/W3Lo3AboSdwjqnT0HPmy4EnOjvD/n9JGWY
         0H8GjF8jPwwNPbtOx3nk95Xvk4xRW/wT8MPcxg8T1i2fVs32q3inmx0BdZTyvS6c2VEX
         1SL17ft77BZUUuM6ZO/f+oo893jkTQd2oBmvHTRhLOLkdjph8cmDwBFLckLJZVqWy4xA
         zUPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769696689; x=1770301489; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s7FuwPAg0PCi+deLDW0+dXgNLEqBVmStAJMhA+lbZ8A=;
        b=VEM5jh69Y5gUEyfZWFISZGoQ8Fsm9cGFgs02JM/wFUV4TNuZeH69IUPQhFM+oS25ds
         Y1hYPnbsoOeEjqStgoY6/iNiwQGS1lMPrfK86iVw6af4WaPC35iuzPp1ynMcMC+Th7w7
         EaE0U3wksKLXgEFRY4tzFhC2fs7cxJCh2u4+7VhPNqbQgHWo6fs2Qc//UaLvQWMW/p35
         yZNwRDozwJJ/PGO27oPqWpKH0iaWyG4oFB9ufKf4SUXViX+EDaECu2RRN1SURgraia/g
         J3Y8bvKsv270H+EJmjaycfyeevLq+ERSzuDn1D+FRku9xtfbQ3I6Ck6Jg8vx75lFqn8v
         WH1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769696689; x=1770301489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s7FuwPAg0PCi+deLDW0+dXgNLEqBVmStAJMhA+lbZ8A=;
        b=SD5NqKlGth0TL1Pa9oLBQmU1wUhcgHIplKNjfvNJ5TCw2Y80g+VudpioPvg+R1i81M
         hjA13jJ73vlw3dbYq7ZHDpUBzIeOB1CCW09AE48G6ce14u8Smp+rhp+u+96BcVcPNjwU
         tEMyAgHOAZlXl3K7dKjv+JfQczQ6fI+UaLiH5uel9Wo86fmrTvo0uMkRI+UL3DDsjtzM
         q43tq9pHovw1A0qluJ1OKcxbh4OX9xMWC7bFnpL/PTQZ0d24cSyhFU5bn4Pkt2Tz5tNV
         UUbOOWRf0tmtlmCJjCQCi2hzGuuhjcFcV+HRSTvv6Lcj0s6yHHEulnRyRZE6ZNfRo52p
         8PXw==
X-Forwarded-Encrypted: i=1; AJvYcCXUpFeKfoSRkfh8FOY13CWR3oylSyUGmRrKtNq3YCYryKVaxEZr+UZpB5iiME5/cQAews3QqKFkfuLP@vger.kernel.org
X-Gm-Message-State: AOJu0YwRb93sS/4CJE2iUwXzijwQkLn16Zy9lEnYqkwG8dfMytF1IBVS
	OGONm7aIV4yXTS8F3uvG1sqMrBxghy0ilJHk0mIRbRmSnz19q/h+UpXaZSUzC02NxXRVt3UJI0E
	sqcAlN/D+/1y5KaJ4wQNs7GedXT371U8=
X-Gm-Gg: AZuq6aIvn+Bd9DJ98p7N1YxbWfSnIdbWLdGlWnrwiPJHrsbdAtkRNDR9rjoVPGw3RBp
	NSWENEDgv+cxGCG89fL5cVxZ1grUIFdha02yzpPqjMFzpUH1+K2uvCyaPpx63A+2HMHUdWlu09R
	9XE+o+o+aLEfrNIBCG2XJnIdUxUGMYIEHQbZs6De4efCzsfU5FxdlWeFs814shU81Zb0ldxreH9
	GPtXLzPc+P0qLeUeMiEod/4enpoV8qgUUAxsfPGbVcYV4l5N0tIBjeZeIU1A3yMypAjxSGi3gvd
	W5g7Xjtv53OXMKJgL0F42NngCCp7p92Tks/hWCXWOCP1qJkiKtZa3prt8evv4y5xaMvpMfE=
X-Received: by 2002:a17:907:c1f:b0:b87:2536:fd9a with SMTP id
 a640c23a62f3a-b8dab3d22a9mr612966766b.59.1769696689248; Thu, 29 Jan 2026
 06:24:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260127214656.447333-1-florian.fainelli@broadcom.com>
In-Reply-To: <20260127214656.447333-1-florian.fainelli@broadcom.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 29 Jan 2026 16:24:11 +0200
X-Gm-Features: AZwV_QiOy3G2NjRYUaEaUk5hinZGYHicnAm1TELmap2-pncZyz1_cZokRrT0m0A
Message-ID: <CAHp75VdxQXDiAf+-0vXao8RdDSMJ70DQ8pZVz-EE8s7ZUdfmrQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] gpio: brcmstb: Bug fixes and wake-up interrupt improvements
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, Doug Berger <opendmb@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Christophe Leroy <chleroy@kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31301-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,broadcom.com,kernel.org,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[broadcom.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 2688FB0E42
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 11:47=E2=80=AFPM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> This patch series corrects the HW interrupt to the bank mapping logic to
> be more robust and do not assume any particular order.
>
> The last two patches improve the handling of early wake-up conditions
> and makes it more robust so we can use those during "s2idle".

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko

