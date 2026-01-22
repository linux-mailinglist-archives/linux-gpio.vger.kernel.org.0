Return-Path: <linux-gpio+bounces-30886-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GId4OAfXcWk+MgAAu9opvQ
	(envelope-from <linux-gpio+bounces-30886-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 08:51:35 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C4562A9D
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 08:51:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7109F5680A3
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 07:43:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2BDC34C83D;
	Thu, 22 Jan 2026 07:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VmabzzKh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D0744D015
	for <linux-gpio@vger.kernel.org>; Thu, 22 Jan 2026 07:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769067766; cv=pass; b=KV5o98cN3TG4nf4UecbptCRWxhmpOXi/fwqh47e85fYxDx8sZDu5DmUzEBPzN2dgVIfWvaqv3CoPUzKdQhMriua23qzPssFlGfLCkmHADDWI2eTiggfTv/92k8YLLNYYJg7pzizC/XPF9m6PCq7sd3M/TyeJjWp35X9J+ttKitk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769067766; c=relaxed/simple;
	bh=GGCDmKaZmTTu4V2ZylePawixMe/gH7BU00kQPFBVnrw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uNfv63FZhCvQbMXImU9rFxcXxsKHaIy6nHnyMa144GtIwX5n5/Ds1QlRJIFV+moFv78ELIFXjrO4tfz0C9Ao5Icy+k1UWeN4SFpcc3pw4DUu0nwi9XOJpaIh//99rmTp6XHu/ZikZiU0efAs9tC2eg3JpjRIubdpSUZD8hg3Y2g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VmabzzKh; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-652fdd043f9so1126489a12.1
        for <linux-gpio@vger.kernel.org>; Wed, 21 Jan 2026 23:42:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769067761; cv=none;
        d=google.com; s=arc-20240605;
        b=RbN7kakyy6gsD6toqYhtUeJVIfg4qwXZHWUWqrC/qt+w9W6glS7pBVILteokt+il92
         2zEQpsHRLxzAVUKqe7A7ao31EBAQb983ScNabMxeUp3m35Misd4oqQqH07bz+YSotBte
         6QE1x/0Bo2CnPdrOos8OBGeTAYCuFYLIPY7cjEGO/0dz71e9RmC/6xmbeXmLFLsc8Xk0
         Ps8UrjZqgLxHj3LUwZ4VkuqJWo+eRatnYvSKsWaRdToXfZF3AwniEJltgGpYftjO9a8R
         88qVzUFrws0Cf4bxi5t7ut7XAcU3R+6hZ1noZQmbQEsJulIirni7l5Hgb0hZKFCzQBD9
         bJMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YzdckLOvviUQpZqUvuM6GKWGoyZ0Z9gzfOnU7fb0Qa0=;
        fh=Eage8GLfnBNGiNkj872TWT3rX86K9JnJK02RMmU5bqE=;
        b=M9nfhtdO2f/qc1XACbNBTLzk3Ez4JXGurO5YYCIeBsBdV2W/Y5BCGFYhpZ6fZgckNb
         SQqsssUGaHXX6wlnod3IzMXHTaY8y8ZxCxaprBqI3P3SEyLVznU30XcpcR+YLIR2/814
         nRvD0E6Cprl4rw74hxy+sEFx44UXQn+swuAXGF32eD1pc4pWOWEgdNU1B2Ko7mT4U7zS
         +DgAiFsTDsYEuBEh+aM5LugTvSL0jl4XACBl/i5WAsibskA+FKIG5Kf+/d5tupI5YyCB
         1q3LxYaBd617pGquuoLmo0PXAn0xdcTEk8TwhnNDkELNQNyDM1IUhqFXKBNGxCJydtpJ
         w0jQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769067761; x=1769672561; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YzdckLOvviUQpZqUvuM6GKWGoyZ0Z9gzfOnU7fb0Qa0=;
        b=VmabzzKhwEl3xf1v4zUjNGDWTvd7Q1HscTJAOdec9Ht182ezal7HODg4LiQhndj1H5
         adgLJG0YxDoOYyxsNGGPtxiBLtI633yj+Ce9yu1TUvqG5+C7qy5IqRb5eD4t471HDFuh
         hk4cyYH00iNxQlrxnM5RHu3OherulwgPNbESoVRdLCIT1sBId03xUWqG45vfzqINMzS+
         LjtJw1lJPr5tcRrAczUioS/TpxhVQuj1YrqxbaxlN8iOb7uMJ38ekmjm0szl7bAYrCIH
         7Cl2IgSDq1rj0iCBTuVDuJZROibbO4RRI/KAkVsIKj2+51BO9OCmEgFJs1AFLizIPHmO
         oU3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769067761; x=1769672561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YzdckLOvviUQpZqUvuM6GKWGoyZ0Z9gzfOnU7fb0Qa0=;
        b=vmoOrg5Aq8ikjDWShUMx4cJ5BpRf+5ukk486jA7JKTM+rpN2bh6HQh26fupFC2BFok
         /PWB+UBmTWdkSP1OJjAYZPH3I4qeQxcLlVag6p6aZrn/I1pYpUUKixL8NqDON97o4z92
         dAIqzyNAUXFoIjw4ywIfqX5vI99zD0kkbY0KmbGlTHiubVB2UNMesRgzWm6O3LhJU9SB
         PbJ3/++jE6QbIQwQyw6mVgYFiZXkEFcDUhTPXbZBQARAp+Im39mRuLoh27Y+FpV2NhqZ
         +AhoY2Wjk1Jy/Jh58x01zTnD9v4CROgcJMBEdxLENRIr68wVywWlXEfkWElum86AErDB
         qrAw==
X-Forwarded-Encrypted: i=1; AJvYcCUzGGIvThgS9NRXUR0obp9jAXZAPs5bkz0q8pu0yoCz8JAVJApbPkhzrOt6USZp9FvNKHx2HIxXBWGj@vger.kernel.org
X-Gm-Message-State: AOJu0YwFJG4sQV4KtxTXbkSSR+QcmD+vyi1q6G2PbzqlefunaJd5wOy/
	2MMl1NQRdH9SHG7q0ppLItaLUqMg+4vWJecUR8bdSWfgwKgPTN4tNm60/zXR4+Kf9HpZ8Q3h9Ui
	m7dJc2zD2FNdopwxzO3A7l0ZNZHsMOPv3N6eK
X-Gm-Gg: AZuq6aIawvK2lcxE7QeWWoVWHoMOwCQkWNcplC25W7Rsv9BOVU+aGcI0z8yQZ6X0JUv
	SuiIl3YUTFsTPtklgU1SDV9gi8m7yCUpY/cNc3ofER+P2CGAf+JK70v4KB37pMPokxs/DSTpFu6
	tQK6sg67GjJ6l6nKF3THu+xM/EyTQqBT4GpR1x0jnpPZhlsuwMl10KcbSAKQkIDz4EGngAbYEQ9
	nSyVuZFauSTTAQ6zpDq3BGMTFjUJ7zTjfkFhssd/5YzN3cGp7YQ5lXOcHFnyQrFXkGRne7n9oAW
	KOfDOKppM1Fk/GD8pQQ27roqQd9QCGYony6e8UhgY8YkVF/uTMQby7CR95QaLE3Brth40rA=
X-Received: by 2002:a17:907:d8f:b0:b87:d44:81d with SMTP id
 a640c23a62f3a-b8793035657mr1651237366b.45.1769067761098; Wed, 21 Jan 2026
 23:42:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122010516.1200630-1-florian.fainelli@broadcom.com> <20260122010516.1200630-4-florian.fainelli@broadcom.com>
In-Reply-To: <20260122010516.1200630-4-florian.fainelli@broadcom.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 22 Jan 2026 09:42:04 +0200
X-Gm-Features: AZwV_Qh_-eMDGWDi_48iA2SRMstayt46m5tzsAPhrjuY_D8cPtNMI-WDccTzmy8
Message-ID: <CAHp75VfhEZ60F7ZHkjNDZ3JR6B6tNF5ORUDPoN8ZibbvF=js8w@mail.gmail.com>
Subject: Re: [PATCH 3/3] gpio: brcmstb: allow parent_irq to wake
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, Doug Berger <opendmb@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Christophe Leroy <chleroy@kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30886-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,broadcom.com,kernel.org,lists.infradead.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,mail.gmail.com:mid,broadcom.com:email]
X-Rspamd-Queue-Id: 97C4562A9D
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 3:06=E2=80=AFAM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:

> The classic parent_wake_irq can only occur after the system has
> been placed into a hardware managed power management state. This
> prevents its use for waking from software managed suspend states
> like s2idle.
>
> By allowing the parent_irq to be enabled for wake enabled GPIO
> during suspend, these GPIO can now be used to wake from these
> states. The 'suspended' boolean is introduced to support wake
> event accounting.

> Signed-off-by: Doug Berger <opendmb@gmail.com>
> [florian: port changes after generic gpio chip conversion]

Likewise in the previous patch I think this deserves the Co-developed-by ta=
g.

> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>

...

> +               if (priv->suspended && bank->wake_active & (u32)status) {

Why casting?

> +                       priv->suspended =3D false;
> +                       pm_wakeup_event(&priv->pdev->dev, 0);
> +               }

...

>  static void brcmstb_gpio_shutdown(struct platform_device *pdev)
>  {
> +       struct brcmstb_gpio_priv *priv =3D dev_get_drvdata(&pdev->dev);

> +       /* disable interrupts */

A useless comment.

> +       if (priv->parent_irq > 0)
> +               disable_irq(priv->parent_irq);
> +
>         /* Enable GPIO for S5 cold boot */
> -       brcmstb_gpio_quiesce(&pdev->dev, false);
> +       brcmstb_gpio_quiesce(priv, false);
>  }

...

>  static const struct dev_pm_ops brcmstb_gpio_pm_ops =3D {

> +       .suspend_noirq =3D pm_sleep_ptr(brcmstb_gpio_suspend_noirq),
>         .resume_noirq =3D pm_sleep_ptr(brcmstb_gpio_resume),

May we use one of the PM macros for these two assignments?

>  };


--=20
With Best Regards,
Andy Shevchenko

