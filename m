Return-Path: <linux-gpio+bounces-35861-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULIRD0gq82mwxgEAu9opvQ
	(envelope-from <linux-gpio+bounces-35861-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 12:09:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9041F4A086D
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 12:09:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10419300C5A2
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 09:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74EBC393DD9;
	Thu, 30 Apr 2026 09:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cU9Ff4nm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3677439BFFF
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 09:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777543037; cv=none; b=jZsSBV73LnRCPAj76Kn4WDEzEWxAxAkLeASAdPS63CbOyZ/hKBZOfHbhJPUC/6VHQGiDq66H3P2Cj0sl3ub1JrzYWqS0nxOFtyIrOtk0nXD1e1gOjf3eMvx06YCrpAZIB6hfTU+qiY+4YwXlWfJQ14Am2TOYKOx2FX2Hv2KtxHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777543037; c=relaxed/simple;
	bh=RwvCmSJulumGeXi0ewU+k1aaU5bqDhOyaS0bBtaKz2E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WuTxUr4TTjiYYk0WfMdjSpFTAk7gZWydXzPlEXOtg6ENjG4J8iUXtUA47cMONYCeE/3oO/yR036tb0VydetNsp0VtU+9PoAAJCrAqc2kIJd11nXlgyfd7T7n1wNJtkbfiXSog3Y1ZWELw/fBr7AQ5a1hz2Mv7wZ8q0qQyaK2rsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cU9Ff4nm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A1FEC2BCB4
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 09:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777543037;
	bh=RwvCmSJulumGeXi0ewU+k1aaU5bqDhOyaS0bBtaKz2E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cU9Ff4nmkLDTLzmGXxKUOxohnzH4mL9BQn4BqdNSH/FJnveFlWSQlSM6H8nivu0ev
	 0HUsZ0zlLuKIXXtdmpnuQzI9DfLmhIoj8M123u+C+kzy1HSroafDcYQlqGnDFKvgMF
	 RmpxT9ePP+3svCU/swn35V3tuJ2d0oBWeXsqj/Uvsig8NagoZCOPNDy+A0mhyFVKud
	 nqCC9Ir+dPsmOmypEm+ufJDvsM0tGcrTnALAAEhRlRuCKwYAjK5JQxmeeIelKVvOUL
	 9/Usg4QfAN/biDR+XWh4tI0APNb9ewX3RSxjjGt9woPeyNFnbGcAG8oP5qU1q3jCfb
	 8+POysTjEqX0g==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a4113ab355so756245e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 02:57:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/VTDtxFKxpppLthBiOGZ1L2weUe46gbxglrAVmaa/ic/5BvdUBGDkEpnuxu9b1qzJem315emSfX/T+@vger.kernel.org
X-Gm-Message-State: AOJu0YyyUT33EIkGtba3ftDBzCcZ8Ojc92QxhPIjLhUXJ+YqyY8aIgmx
	GSbOEbo5ZbvAjyA4ogZt1+Awb4tnxYsgkxO8Iqjx2k7id/70nCqme/7wI+sKYiiUWM8ytnNendP
	v6xNU34qUEsrWabo/hnVIMw/Z+zMxbvo=
X-Received: by 2002:a05:6512:4017:b0:5a2:864a:bebb with SMTP id
 2adb3069b0e04-5a8522d4eb8mr758559e87.20.1777543035289; Thu, 30 Apr 2026
 02:57:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430-baytrail-real-swnode-v4-0-767bcda6667f@oss.qualcomm.com> <20260430-baytrail-real-swnode-v4-1-767bcda6667f@oss.qualcomm.com>
In-Reply-To: <20260430-baytrail-real-swnode-v4-1-767bcda6667f@oss.qualcomm.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 30 Apr 2026 11:57:01 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0jooK3LqEXOH3m6Le4gDiMDOjCAawsmq_Kzim7T76kcDw@mail.gmail.com>
X-Gm-Features: AVHnY4LLRxYWhknbQDaqqATspis7Xhq8JMKrXRvQlheeSpBHn0eRZucKuI2NAL8
Message-ID: <CAJZ5v0jooK3LqEXOH3m6Le4gDiMDOjCAawsmq_Kzim7T76kcDw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] ACPI: provide acpi_bus_find_device_by_name()
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	brgl@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 9041F4A086D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35861-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[linux.intel.com,gmail.com,linuxfoundation.org,kernel.org,vger.kernel.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rafael@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,mail.gmail.com:mid]

On Thu, Apr 30, 2026 at 9:34=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> Provide a helper allowing to locate an ACPI device by its name.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>

> ---
>  drivers/acpi/bus.c   | 13 +++++++++++++
>  include/linux/acpi.h |  7 +++++++
>  2 files changed, 20 insertions(+)
>
> diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
> index 2ec095e2009e40b0645f654fb051429e5679dc7c..5dd8459be03db4165bcb59943=
b94ea7db273ad7b 100644
> --- a/drivers/acpi/bus.c
> +++ b/drivers/acpi/bus.c
> @@ -1181,6 +1181,19 @@ int acpi_bus_for_each_dev(int (*fn)(struct device =
*, void *), void *data)
>  }
>  EXPORT_SYMBOL_GPL(acpi_bus_for_each_dev);
>
> +/**
> + * acpi_bus_find_device_by_name() - Locate an ACPI device by its name
> + * @name: Name of the device to match
> + *
> + * Returns:
> + * New reference to the matched device or NULL if the device can't be fo=
und.
> + */
> +struct device *acpi_bus_find_device_by_name(const char *name)
> +{
> +       return bus_find_device_by_name(&acpi_bus_type, NULL, name);
> +}
> +EXPORT_SYMBOL_GPL(acpi_bus_find_device_by_name);
> +
>  struct acpi_dev_walk_context {
>         int (*fn)(struct acpi_device *, void *);
>         void *data;
> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> index 67effb91fa98373d7bf19be5ae3d8baa9328d6e1..10d6c6c11bdffcad14100601e=
104520366dfc30b 100644
> --- a/include/linux/acpi.h
> +++ b/include/linux/acpi.h
> @@ -798,6 +798,8 @@ int acpi_get_local_u64_address(acpi_handle handle, u6=
4 *addr);
>  int acpi_get_local_address(acpi_handle handle, u32 *addr);
>  const char *acpi_get_subsystem_id(acpi_handle handle);
>
> +struct device *acpi_bus_find_device_by_name(const char *name);
> +
>  #ifdef CONFIG_ACPI_MRRM
>  int acpi_mrrm_max_mem_region(void);
>  #endif
> @@ -1106,6 +1108,11 @@ static inline const char *acpi_get_subsystem_id(ac=
pi_handle handle)
>         return ERR_PTR(-ENODEV);
>  }
>
> +static inline struct device *acpi_bus_find_device_by_name(const char *na=
me)
> +{
> +       return NULL;
> +}
> +
>  static inline int acpi_register_wakeup_handler(int wake_irq,
>         bool (*wakeup)(void *context), void *context)
>  {
>
> --
> 2.47.3
>

