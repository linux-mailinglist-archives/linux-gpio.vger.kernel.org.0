Return-Path: <linux-gpio+bounces-39749-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NMYMBz69T2pfngIAu9opvQ
	(envelope-from <linux-gpio+bounces-39749-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 17:24:46 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D3016732D44
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 17:24:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=S03RJU28;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39749-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39749-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A993D310254E
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2026 15:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62BCE359A99;
	Thu,  9 Jul 2026 15:05:10 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0803126AD
	for <linux-gpio@vger.kernel.org>; Thu,  9 Jul 2026 15:05:05 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783609510; cv=pass; b=LW4CBlapqy395y38TgMD4bqmxxb3Tc2JUCv2InxPDRd1UXBpsY+mt2058F41fHn9Od40nXjN1ADKuORWjfv1yduX0Py/3MISfV7iFwXoZsMF+Fbdv3OeV7EiwMJGBsgoat1FI2Rgpy2jwMW/eKQLUNiCTFLujBRB2JaL7ckAik8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783609510; c=relaxed/simple;
	bh=rEwRUj5n+D4ueXWDyWk/iyVYv80zVGiG3xeWbPp8d84=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O/XDoNp3Gy6el9ATg1HOBaWbUOHMjxfeAIQLTCiiHEo6CEirD7W2GkDGqwpNcYFek1QxjauUCc9WV1eDV397iKMX6OiL+bqo2dKy0qoKP41Cx5j0+9567JKrr8srNhqyEzjoCccuSD3COVAYcyUKsUlfR9822XDxILXz/dITCgU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S03RJU28; arc=pass smtp.client-ip=209.85.208.49
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-69532288224so1977889a12.0
        for <linux-gpio@vger.kernel.org>; Thu, 09 Jul 2026 08:05:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783609504; cv=none;
        d=google.com; s=arc-20260327;
        b=QCfezII28iL3KX5Wy1dXSONhGbB1aeCx7B+bu15advzJ4rkvXiETDqWAR9b++WWOih
         TNCEi/oSqyU3uBmTEOUL0caZ69cvvz/bQG7j9wsDmzQVPAEyZ+sLhyxLDDkWVxrIR5ke
         rS7k6x/tXlndgoAqo9e4vMN2QmDZk8XO/Cp3lvaBzxchkvTTeAmzHWvCSW/p25vcGXZ8
         iDh26V9IV+Js5iunGkGD9aJdVQJvcNDQXcs1NMljrk9FZG8C8osGDMH0F+s2Rj/WMdod
         2UmF6HYtDwYRaCA0cU/hJZ9j0quqfRdyFj9/NYCgILYzpQ0+kiXb/vKGwQUJ03flSFKn
         l2mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZqzpN44guGdonZBxzCyAR5YSvJH+eiLOFsoMHP8Exug=;
        fh=hldgFzYmxywlOR8SDOmzXL+w2smVZPMBvB5EIjPoBDQ=;
        b=UXdWqeRpC1tRo83js9UwmKr0klzyL4dKwffsL1MbVVysTlAVjfw2f0wHCCbZFAZTWm
         4drMWCVYlyUX10V2VWBSxrm3Dl2H6c7Hv320wDp2ul+J19vHvZk/4iZ72KGEpaWxAC+M
         yqQHMbcrNh8Vwxpu7wsLGgVNY8nuzK2tkPCYEVu8KSoshFqxsBhu5AwQzlzK+CDJa7Qo
         JdK2IwJtQqUo429F6vQAzeoqiHazhQ9J9qB7+dh9LhdQZnRlHb5SnHboVnJrJjBrNyOm
         YmtHisF+x25xdQQhsGztArhgSdkB9k4gi2cTZ3YQuuXgLNRXI55Gkt1/uHFnPwRPvffM
         gpdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783609504; x=1784214304; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZqzpN44guGdonZBxzCyAR5YSvJH+eiLOFsoMHP8Exug=;
        b=S03RJU280UGOMzwKE4QpK8mrq3gbh/PqpZ7hnHZPuRRwEDmpKDUnuSRSzVhWKxh7ln
         sl85EAJdMUAYU4lYy0WPPyR5UdhN3LRHa2uGps5KM/YExdv+cH842vM7X45QuViw9wx/
         CzrLUAvcBKngKZT5Ou/brnzFEVY+43mLvA+XLuDlznbHWc9vPGvYmg4RC4QrE2aLqHEG
         II+L5L11bAzkEjCi8Wa3iogwd0vML/MGQ1afcFdi/cMdVA5KNdrFUFMxjVSOnP7FIiwx
         CXowyc885Rfl90kYZVTn0wCCHIVCTSexB5mzdc24ZIpnW+votNBqGHS1C+2Vq2CD1q81
         FoWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783609504; x=1784214304;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZqzpN44guGdonZBxzCyAR5YSvJH+eiLOFsoMHP8Exug=;
        b=D017ipINhrVI9kKJnb0l3/zjFao/KVtj77ikJJ6DHsP0mhqJAG/O01ZCtIYMJxhZnK
         yLWT/W/GzfQl2cyZPXK4xMbA9QM75Ngxc/HKxrMzkuFjmdIsHPxOt+WkaBpmpgrXyL+0
         LmmXPVO6ZwT1yvmv3z5HYeGLlWYH93C1IvnWNYgqws5bWUhSm/Zx8B1e5Jxi7u+412OX
         VSmIQbGg27siSBWdqfDaS+m2u1KM6iXUynTwYKTExNjoIDnh78YV+xN7myoHgaOoPegf
         ajFkHzodPLbaR4sHdhOu6sK4imk+iqzMFvVBWCX+6wjRbMqWLJ47pO83J33RVQDeVpPo
         t4rA==
X-Forwarded-Encrypted: i=1; AHgh+RrB5zIWp2Pcyi2lfzkfOLvPSOVKNzAO2Eqax5/GKERs5GntzPx8oCXNDxOqeGZPNq+yBGt5wq+0Cdst@vger.kernel.org
X-Gm-Message-State: AOJu0YyBQWLhVjJiKIhoPUfma/cVMUjMuRmgQqaLEOwv3NJkA9r7LEkh
	ToBXr+4ozJ4SCiyzUk4fOJant4RoqXKjNZT6S+rjDvhpqQdrCOM21GmByRlxnrBDnHCfKmQ3ISd
	kHaTMjbA2XnALg4r2E3OVN5zpxla4ItaMqAZidFENDg==
X-Gm-Gg: AfdE7clByHD5OtBoOQHnfF63efd8lhzAkDNcGdlqRwthk+FsiSFJS8GOHtTzD0kRtRl
	5S2NENruFuHLecC0dk9hP1CkwSmG3nob6NBhBFwAMvtzRGR1Iqmb+8eb4gTeWbtfFsXFM3pSMYg
	XFm/zhnO2hVI/wRrNamLRy9S+jLfy+GWso2BLtRLzFH8fetJoj3zJKMXDrxtPQGRv7piAk4s/wG
	77SMjOhBh8UJVbIlbf+m7brrJqBtt0HXbaozblRoj5sq5gJBaMONKujsrFwQ3rdy505HKsBKMb7
	4MFB1UYLS88hakXox6x1IoE5xVgstn91iZYN
X-Received: by 2002:a05:6402:43c4:b0:698:af30:5dde with SMTP id
 4fb4d7f45d1cf-69ab44612bamr3206035a12.13.1783609504280; Thu, 09 Jul 2026
 08:05:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <d7f7e8c9589d937b60e43168845ab4fda15037a3.1783603600.git.michal.simek@amd.com>
In-Reply-To: <d7f7e8c9589d937b60e43168845ab4fda15037a3.1783603600.git.michal.simek@amd.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 9 Jul 2026 17:04:52 +0200
X-Gm-Features: AUfX_mxIBzHMPQNpSXnMtJ5nAckyvtqUZpsw3N-GZ2wcaGq2h6aw6oD6BWgvcxU
Message-ID: <CAKfTPtCQSjyGmqBOOV8BjqB5EEqjVjCQ8hihDFQ0umtaG1CWSg@mail.gmail.com>
Subject: Re: [RFC PATCH] firmware: scmi: Make SCMI arch independent
To: Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, monstr@monstr.eu, git@amd.com, 
	Souvik.Chakravarty@arm.com, Alex Shi <alexs@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, David Lechner <dlechner@baylibre.com>, 
	Dongliang Mu <dzm91@hust.edu.cn>, Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Guenter Roeck <linux@roeck-us.net>, Jonathan Cameron <jic23@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Len Brown <lenb@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linus Walleij <linusw@kernel.org>, 
	Lukasz Luba <lukasz.luba@arm.com>, Mark Brown <broonie@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Pavel Machek <pavel@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shuah Khan <skhan@linuxfoundation.org>, Stephen Boyd <sboyd@kernel.org>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Yanteng Si <si.yanteng@linux.dev>, arm-scmi@vger.kernel.org, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, linux-arm-kernel@lists.infradead.org, 
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>, 
	"open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, 
	"open list:ENERGY MODEL" <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:michal.simek@amd.com,m:linux-kernel@vger.kernel.org,m:monstr@monstr.eu,m:git@amd.com,m:Souvik.Chakravarty@arm.com,m:alexs@kernel.org,m:andy@kernel.org,m:brgl@kernel.org,m:bmasney@redhat.com,m:cristian.marussi@arm.com,m:dlechner@baylibre.com,m:dzm91@hust.edu.cn,m:festevam@gmail.com,m:Frank.Li@nxp.com,m:linux@roeck-us.net,m:jic23@kernel.org,m:corbet@lwn.net,m:lenb@kernel.org,m:lgirdwood@gmail.com,m:linusw@kernel.org,m:lukasz.luba@arm.com,m:broonie@kernel.org,m:mturquette@baylibre.com,m:nuno.sa@analog.com,m:pavel@kernel.org,m:peng.fan@nxp.com,m:kernel@pengutronix.de,m:p.zabel@pengutronix.de,m:rafael@kernel.org,m:s.hauer@pengutronix.de,m:skhan@linuxfoundation.org,m:sboyd@kernel.org,m:sudeep.holla@kernel.org,m:ulfh@kernel.org,m:viresh.kumar@linaro.org,m:si.yanteng@linux.dev,m:arm-scmi@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-clk@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-hwmon@vger
 .kernel.org,m:linux-iio@vger.kernel.org,m:linux-pm@vger.kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-39749-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[vincent.guittot@linaro.org,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[45];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,monstr.eu,amd.com,arm.com,kernel.org,redhat.com,baylibre.com,hust.edu.cn,gmail.com,nxp.com,roeck-us.net,lwn.net,analog.com,pengutronix.de,linuxfoundation.org,linaro.org,linux.dev,lists.linux.dev,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vincent.guittot@linaro.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D3016732D44

On Thu, 9 Jul 2026 at 15:28, Michal Simek <michal.simek@amd.com> wrote:
>
> On heterogenious systems like AMD/Xilinx FPGA there is a need to talk to
> SCMI server from different architectures than ARM that's why remove
> ARM/ARM64 Kconfig dependency with also remove ARM from description and
> rename folder to reflect it.
> From specification perspective only ARM specific transport layers should =
be
> available on ARM/ARM64 architectures.
>
> That's why get rid of ARM prefix and description from documentation, file
> names, folder names, MODULE description, module names, Kconfig and
> comments.
> But keep origin Kconfig symbols not to break existing users.
>
> Hwmon, pinctrl, powercap, regulator, reset, clk and cpufreq scmi drivers
> already miss arm prefix that's why synchronize all of them to be without
> arm prefix.
>
> Signed-off-by: Michal Simek <michal.simek@amd.com>
> ---
>
> Likely I missed other locations but I wanted to send this RFC to have a
> discussion about it.

FWIW, make sense to me
Acked-by: Vincent Guittot <vincent.guittot@linaro.org>

> ---
>  Documentation/power/energy-model.rst                  |  2 +-
>  .../translations/zh_CN/power/energy-model.rst         |  2 +-
>  MAINTAINERS                                           |  6 +++---
>  drivers/clk/clk-scmi.c                                |  2 +-
>  drivers/cpufreq/scmi-cpufreq.c                        |  2 +-
>  drivers/firmware/Kconfig                              |  2 +-
>  drivers/firmware/Makefile                             |  2 +-
>  drivers/firmware/{arm_scmi =3D> scmi}/Kconfig           | 11 +++++------
>  drivers/firmware/{arm_scmi =3D> scmi}/Makefile          |  0
>  drivers/firmware/{arm_scmi =3D> scmi}/base.c            |  0
>  drivers/firmware/{arm_scmi =3D> scmi}/bus.c             |  0
>  drivers/firmware/{arm_scmi =3D> scmi}/clock.c           |  0
>  drivers/firmware/{arm_scmi =3D> scmi}/common.h          |  0
>  drivers/firmware/{arm_scmi =3D> scmi}/driver.c          |  0
>  drivers/firmware/{arm_scmi =3D> scmi}/msg.c             |  0
>  drivers/firmware/{arm_scmi =3D> scmi}/notify.c          |  0
>  drivers/firmware/{arm_scmi =3D> scmi}/notify.h          |  0
>  drivers/firmware/{arm_scmi =3D> scmi}/perf.c            |  0
>  drivers/firmware/{arm_scmi =3D> scmi}/pinctrl.c         |  0
>  drivers/firmware/{arm_scmi =3D> scmi}/power.c           |  0
>  drivers/firmware/{arm_scmi =3D> scmi}/powercap.c        |  0
>  drivers/firmware/{arm_scmi =3D> scmi}/protocols.h       |  0
>  drivers/firmware/{arm_scmi =3D> scmi}/quirks.c          |  0
>  drivers/firmware/{arm_scmi =3D> scmi}/quirks.h          |  0
>  drivers/firmware/{arm_scmi =3D> scmi}/raw_mode.c        |  0
>  drivers/firmware/{arm_scmi =3D> scmi}/raw_mode.h        |  0
>  drivers/firmware/{arm_scmi =3D> scmi}/reset.c           |  0
>  .../firmware/{arm_scmi =3D> scmi}/scmi_power_control.c  |  0
>  drivers/firmware/{arm_scmi =3D> scmi}/sensors.c         |  0
>  drivers/firmware/{arm_scmi =3D> scmi}/shmem.c           |  0
>  drivers/firmware/{arm_scmi =3D> scmi}/system.c          |  0
>  .../firmware/{arm_scmi =3D> scmi}/transports/Kconfig    |  0
>  .../firmware/{arm_scmi =3D> scmi}/transports/Makefile   |  0
>  .../firmware/{arm_scmi =3D> scmi}/transports/mailbox.c  |  0
>  .../firmware/{arm_scmi =3D> scmi}/transports/optee.c    |  0
>  drivers/firmware/{arm_scmi =3D> scmi}/transports/smc.c  |  0
>  .../firmware/{arm_scmi =3D> scmi}/transports/virtio.c   |  0
>  .../firmware/{arm_scmi =3D> scmi}/vendors/imx/Kconfig   |  0
>  .../firmware/{arm_scmi =3D> scmi}/vendors/imx/Makefile  |  0
>  .../{arm_scmi =3D> scmi}/vendors/imx/imx-sm-bbm.c       |  0
>  .../{arm_scmi =3D> scmi}/vendors/imx/imx-sm-cpu.c       |  0
>  .../{arm_scmi =3D> scmi}/vendors/imx/imx-sm-lmm.c       |  0
>  .../{arm_scmi =3D> scmi}/vendors/imx/imx-sm-misc.c      |  0
>  .../firmware/{arm_scmi =3D> scmi}/vendors/imx/imx95.rst |  0
>  drivers/firmware/{arm_scmi =3D> scmi}/voltage.c         |  0
>  drivers/gpio/Kconfig                                  |  2 +-
>  drivers/hwmon/Kconfig                                 |  2 +-
>  drivers/iio/common/scmi_sensors/Kconfig               |  2 +-
>  drivers/pinctrl/pinctrl-scmi.c                        |  2 +-
>  drivers/pmdomain/arm/scmi_perf_domain.c               |  2 +-
>  drivers/pmdomain/arm/scmi_pm_domain.c                 |  2 +-
>  drivers/powercap/Kconfig                              |  4 ++--
>  drivers/powercap/Makefile                             |  2 +-
>  .../powercap/{arm_scmi_powercap.c =3D> scmi_powercap.c} |  2 +-
>  drivers/regulator/scmi-regulator.c                    |  2 +-
>  drivers/reset/Kconfig                                 |  2 +-
>  drivers/reset/reset-scmi.c                            |  4 ++--
>  57 files changed, 28 insertions(+), 29 deletions(-)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/Kconfig (91%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/Makefile (100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/base.c (100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/bus.c (100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/clock.c (100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/common.h (100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/driver.c (100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/msg.c (100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/notify.c (100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/notify.h (100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/perf.c (100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/pinctrl.c (100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/power.c (100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/powercap.c (100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/protocols.h (100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/quirks.c (100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/quirks.h (100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/raw_mode.c (100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/raw_mode.h (100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/reset.c (100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/scmi_power_control.c (100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/sensors.c (100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/shmem.c (100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/system.c (100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/transports/Kconfig (100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/transports/Makefile (100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/transports/mailbox.c (100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/transports/optee.c (100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/transports/smc.c (100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/transports/virtio.c (100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/vendors/imx/Kconfig (100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/vendors/imx/Makefile (100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/vendors/imx/imx-sm-bbm.c (1=
00%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/vendors/imx/imx-sm-cpu.c (1=
00%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/vendors/imx/imx-sm-lmm.c (1=
00%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/vendors/imx/imx-sm-misc.c (=
100%)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/vendors/imx/imx95.rst (100%=
)
>  rename drivers/firmware/{arm_scmi =3D> scmi}/voltage.c (100%)
>  rename drivers/powercap/{arm_scmi_powercap.c =3D> scmi_powercap.c} (99%)
>
> diff --git a/Documentation/power/energy-model.rst b/Documentation/power/e=
nergy-model.rst
> index 0d4644d72767..ca147ea36232 100644
> --- a/Documentation/power/energy-model.rst
> +++ b/Documentation/power/energy-model.rst
> @@ -56,7 +56,7 @@ framework, and interested clients reading the data from=
 it::
>                  +----------+       |       +---------+
>                  |                  |                 |
>          +---------------+  +---------------+  +--------------+
> -        |  cpufreq-dt   |  |   arm_scmi    |  |    Other     |
> +        |  cpufreq-dt   |  |      scmi     |  |    Other     |
>          +---------------+  +---------------+  +--------------+
>                  ^                  ^                 ^
>                  |                  |                 |
> diff --git a/Documentation/translations/zh_CN/power/energy-model.rst b/Do=
cumentation/translations/zh_CN/power/energy-model.rst
> index 48849919d8aa..057c76a087cd 100644
> --- a/Documentation/translations/zh_CN/power/energy-model.rst
> +++ b/Documentation/translations/zh_CN/power/energy-model.rst
> @@ -54,7 +54,7 @@ Documentation/driver-api/thermal/power_allocator.rst=E6=
=96=87=E6=A1=A3=E4=B8=AD=E6=89=BE=E5=88=B0=E3=80=82
>                  +----------+       |       +---------+
>                  |                  |                 |
>          +---------------+  +---------------+  +--------------+
> -        |  cpufreq-dt   |  |   arm_scmi    |  |    Other     |
> +        |  cpufreq-dt   |  |      scmi     |  |    Other     |
>          +---------------+  +---------------+  +--------------+
>                  ^                  ^                 ^
>                  |                  |                 |
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f37a81950e25..a15909357b10 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -26293,12 +26293,12 @@ S:    Maintained
>  F:     Documentation/devicetree/bindings/firmware/arm,sc[mp]i.yaml
>  F:     drivers/clk/clk-sc[mp]i.c
>  F:     drivers/cpufreq/sc[mp]i-cpufreq.c
> -F:     drivers/firmware/arm_scmi/
> +F:     drivers/firmware/scmi/
>  F:     drivers/firmware/arm_scpi.c
>  F:     drivers/hwmon/scmi-hwmon.c
>  F:     drivers/pinctrl/pinctrl-scmi.c
>  F:     drivers/pmdomain/arm/
> -F:     drivers/powercap/arm_scmi_powercap.c
> +F:     drivers/powercap/scmi_powercap.c
>  F:     drivers/regulator/scmi-regulator.c
>  F:     drivers/reset/reset-scmi.c
>  F:     include/linux/sc[mp]i_protocol.h
> @@ -26312,7 +26312,7 @@ L:      imx@lists.linux.dev
>  L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscribe=
rs)
>  S:     Maintained
>  F:     Documentation/devicetree/bindings/firmware/nxp,*scmi.yaml
> -F:     drivers/firmware/arm_scmi/vendors/imx/
> +F:     drivers/firmware/scmi/vendors/imx/
>
>  SYSTEM RESET/SHUTDOWN DRIVERS
>  M:     Sebastian Reichel <sre@kernel.org>
> diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
> index 7c562559ad8b..d8736feb73fd 100644
> --- a/drivers/clk/clk-scmi.c
> +++ b/drivers/clk/clk-scmi.c
> @@ -481,5 +481,5 @@ static struct scmi_driver scmi_clocks_driver =3D {
>  module_scmi_driver(scmi_clocks_driver);
>
>  MODULE_AUTHOR("Sudeep Holla <sudeep.holla@arm.com>");
> -MODULE_DESCRIPTION("ARM SCMI clock driver");
> +MODULE_DESCRIPTION("SCMI clock driver");
>  MODULE_LICENSE("GPL v2");
> diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufre=
q.c
> index 4edb4f7a8aa9..51cff1838aca 100644
> --- a/drivers/cpufreq/scmi-cpufreq.c
> +++ b/drivers/cpufreq/scmi-cpufreq.c
> @@ -493,5 +493,5 @@ static struct scmi_driver scmi_cpufreq_drv =3D {
>  module_scmi_driver(scmi_cpufreq_drv);
>
>  MODULE_AUTHOR("Sudeep Holla <sudeep.holla@arm.com>");
> -MODULE_DESCRIPTION("ARM SCMI CPUFreq interface driver");
> +MODULE_DESCRIPTION("SCMI CPUFreq interface driver");
>  MODULE_LICENSE("GPL v2");
> diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
> index 12dc70254842..79c2477b1a7a 100644
> --- a/drivers/firmware/Kconfig
> +++ b/drivers/firmware/Kconfig
> @@ -6,7 +6,7 @@
>
>  menu "Firmware Drivers"
>
> -source "drivers/firmware/arm_scmi/Kconfig"
> +source "drivers/firmware/scmi/Kconfig"
>
>  config ARM_SCPI_PROTOCOL
>         tristate "ARM System Control and Power Interface (SCPI) Message P=
rotocol"
> diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
> index 4ddec2820c96..0d4c2f29069a 100644
> --- a/drivers/firmware/Makefile
> +++ b/drivers/firmware/Makefile
> @@ -24,7 +24,7 @@ obj-$(CONFIG_TRUSTED_FOUNDATIONS) +=3D trusted_foundati=
ons.o
>  obj-$(CONFIG_TURRIS_MOX_RWTM)  +=3D turris-mox-rwtm.o
>
>  obj-y                          +=3D arm_ffa/
> -obj-y                          +=3D arm_scmi/
> +obj-y                          +=3D scmi/
>  obj-y                          +=3D broadcom/
>  obj-y                          +=3D cirrus/
>  obj-y                          +=3D meson/
> diff --git a/drivers/firmware/arm_scmi/Kconfig b/drivers/firmware/scmi/Kc=
onfig
> similarity index 91%
> rename from drivers/firmware/arm_scmi/Kconfig
> rename to drivers/firmware/scmi/Kconfig
> index e3fb36825978..167c22a788a8 100644
> --- a/drivers/firmware/arm_scmi/Kconfig
> +++ b/drivers/firmware/scmi/Kconfig
> @@ -1,11 +1,10 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> -menu "ARM System Control and Management Interface Protocol"
> +menu "System Control and Management Interface Protocol"
>
>  config ARM_SCMI_PROTOCOL
> -       tristate "ARM System Control and Management Interface (SCMI) Mess=
age Protocol"
> -       depends on ARM || ARM64 || COMPILE_TEST
> +       tristate "System Control and Management Interface (SCMI) Message =
Protocol"
>         help
> -         ARM System Control and Management Interface (SCMI) protocol is =
a
> +         System Control and Management Interface (SCMI) protocol is a
>           set of operating system-independent software interfaces that ar=
e
>           used in system management. SCMI is extensible and currently pro=
vides
>           interfaces for: Discovery and self-description of the interface=
s
> @@ -82,8 +81,8 @@ config ARM_SCMI_QUIRKS
>           depending on the SCMI firmware advertised versions and/or machi=
ne
>           compatibles.
>
> -source "drivers/firmware/arm_scmi/transports/Kconfig"
> -source "drivers/firmware/arm_scmi/vendors/imx/Kconfig"
> +source "drivers/firmware/scmi/transports/Kconfig"
> +source "drivers/firmware/scmi/vendors/imx/Kconfig"
>
>  endif #ARM_SCMI_PROTOCOL
>
> diff --git a/drivers/firmware/arm_scmi/Makefile b/drivers/firmware/scmi/M=
akefile
> similarity index 100%
> rename from drivers/firmware/arm_scmi/Makefile
> rename to drivers/firmware/scmi/Makefile
> diff --git a/drivers/firmware/arm_scmi/base.c b/drivers/firmware/scmi/bas=
e.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/base.c
> rename to drivers/firmware/scmi/base.c
> diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/scmi/bus.=
c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/bus.c
> rename to drivers/firmware/scmi/bus.c
> diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/scmi/cl=
ock.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/clock.c
> rename to drivers/firmware/scmi/clock.c
> diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/scmi/c=
ommon.h
> similarity index 100%
> rename from drivers/firmware/arm_scmi/common.h
> rename to drivers/firmware/scmi/common.h
> diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/scmi/d=
river.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/driver.c
> rename to drivers/firmware/scmi/driver.c
> diff --git a/drivers/firmware/arm_scmi/msg.c b/drivers/firmware/scmi/msg.=
c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/msg.c
> rename to drivers/firmware/scmi/msg.c
> diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/scmi/n=
otify.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/notify.c
> rename to drivers/firmware/scmi/notify.c
> diff --git a/drivers/firmware/arm_scmi/notify.h b/drivers/firmware/scmi/n=
otify.h
> similarity index 100%
> rename from drivers/firmware/arm_scmi/notify.h
> rename to drivers/firmware/scmi/notify.h
> diff --git a/drivers/firmware/arm_scmi/perf.c b/drivers/firmware/scmi/per=
f.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/perf.c
> rename to drivers/firmware/scmi/perf.c
> diff --git a/drivers/firmware/arm_scmi/pinctrl.c b/drivers/firmware/scmi/=
pinctrl.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/pinctrl.c
> rename to drivers/firmware/scmi/pinctrl.c
> diff --git a/drivers/firmware/arm_scmi/power.c b/drivers/firmware/scmi/po=
wer.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/power.c
> rename to drivers/firmware/scmi/power.c
> diff --git a/drivers/firmware/arm_scmi/powercap.c b/drivers/firmware/scmi=
/powercap.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/powercap.c
> rename to drivers/firmware/scmi/powercap.c
> diff --git a/drivers/firmware/arm_scmi/protocols.h b/drivers/firmware/scm=
i/protocols.h
> similarity index 100%
> rename from drivers/firmware/arm_scmi/protocols.h
> rename to drivers/firmware/scmi/protocols.h
> diff --git a/drivers/firmware/arm_scmi/quirks.c b/drivers/firmware/scmi/q=
uirks.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/quirks.c
> rename to drivers/firmware/scmi/quirks.c
> diff --git a/drivers/firmware/arm_scmi/quirks.h b/drivers/firmware/scmi/q=
uirks.h
> similarity index 100%
> rename from drivers/firmware/arm_scmi/quirks.h
> rename to drivers/firmware/scmi/quirks.h
> diff --git a/drivers/firmware/arm_scmi/raw_mode.c b/drivers/firmware/scmi=
/raw_mode.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/raw_mode.c
> rename to drivers/firmware/scmi/raw_mode.c
> diff --git a/drivers/firmware/arm_scmi/raw_mode.h b/drivers/firmware/scmi=
/raw_mode.h
> similarity index 100%
> rename from drivers/firmware/arm_scmi/raw_mode.h
> rename to drivers/firmware/scmi/raw_mode.h
> diff --git a/drivers/firmware/arm_scmi/reset.c b/drivers/firmware/scmi/re=
set.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/reset.c
> rename to drivers/firmware/scmi/reset.c
> diff --git a/drivers/firmware/arm_scmi/scmi_power_control.c b/drivers/fir=
mware/scmi/scmi_power_control.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/scmi_power_control.c
> rename to drivers/firmware/scmi/scmi_power_control.c
> diff --git a/drivers/firmware/arm_scmi/sensors.c b/drivers/firmware/scmi/=
sensors.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/sensors.c
> rename to drivers/firmware/scmi/sensors.c
> diff --git a/drivers/firmware/arm_scmi/shmem.c b/drivers/firmware/scmi/sh=
mem.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/shmem.c
> rename to drivers/firmware/scmi/shmem.c
> diff --git a/drivers/firmware/arm_scmi/system.c b/drivers/firmware/scmi/s=
ystem.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/system.c
> rename to drivers/firmware/scmi/system.c
> diff --git a/drivers/firmware/arm_scmi/transports/Kconfig b/drivers/firmw=
are/scmi/transports/Kconfig
> similarity index 100%
> rename from drivers/firmware/arm_scmi/transports/Kconfig
> rename to drivers/firmware/scmi/transports/Kconfig
> diff --git a/drivers/firmware/arm_scmi/transports/Makefile b/drivers/firm=
ware/scmi/transports/Makefile
> similarity index 100%
> rename from drivers/firmware/arm_scmi/transports/Makefile
> rename to drivers/firmware/scmi/transports/Makefile
> diff --git a/drivers/firmware/arm_scmi/transports/mailbox.c b/drivers/fir=
mware/scmi/transports/mailbox.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/transports/mailbox.c
> rename to drivers/firmware/scmi/transports/mailbox.c
> diff --git a/drivers/firmware/arm_scmi/transports/optee.c b/drivers/firmw=
are/scmi/transports/optee.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/transports/optee.c
> rename to drivers/firmware/scmi/transports/optee.c
> diff --git a/drivers/firmware/arm_scmi/transports/smc.c b/drivers/firmwar=
e/scmi/transports/smc.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/transports/smc.c
> rename to drivers/firmware/scmi/transports/smc.c
> diff --git a/drivers/firmware/arm_scmi/transports/virtio.c b/drivers/firm=
ware/scmi/transports/virtio.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/transports/virtio.c
> rename to drivers/firmware/scmi/transports/virtio.c
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/Kconfig b/drivers/firm=
ware/scmi/vendors/imx/Kconfig
> similarity index 100%
> rename from drivers/firmware/arm_scmi/vendors/imx/Kconfig
> rename to drivers/firmware/scmi/vendors/imx/Kconfig
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/Makefile b/drivers/fir=
mware/scmi/vendors/imx/Makefile
> similarity index 100%
> rename from drivers/firmware/arm_scmi/vendors/imx/Makefile
> rename to drivers/firmware/scmi/vendors/imx/Makefile
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c b/drivers=
/firmware/scmi/vendors/imx/imx-sm-bbm.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c
> rename to drivers/firmware/scmi/vendors/imx/imx-sm-bbm.c
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c b/drivers=
/firmware/scmi/vendors/imx/imx-sm-cpu.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c
> rename to drivers/firmware/scmi/vendors/imx/imx-sm-cpu.c
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-lmm.c b/drivers=
/firmware/scmi/vendors/imx/imx-sm-lmm.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/vendors/imx/imx-sm-lmm.c
> rename to drivers/firmware/scmi/vendors/imx/imx-sm-lmm.c
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c b/driver=
s/firmware/scmi/vendors/imx/imx-sm-misc.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> rename to drivers/firmware/scmi/vendors/imx/imx-sm-misc.c
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx95.rst b/drivers/fi=
rmware/scmi/vendors/imx/imx95.rst
> similarity index 100%
> rename from drivers/firmware/arm_scmi/vendors/imx/imx95.rst
> rename to drivers/firmware/scmi/vendors/imx/imx95.rst
> diff --git a/drivers/firmware/arm_scmi/voltage.c b/drivers/firmware/scmi/=
voltage.c
> similarity index 100%
> rename from drivers/firmware/arm_scmi/voltage.c
> rename to drivers/firmware/scmi/voltage.c
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 28cf6d2e83c2..1319c466ee87 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -262,7 +262,7 @@ config GPIO_BY_PINCTRL
>           create a simple GPIO device based on the pin control interface
>           without doing anything custom.
>
> -         This driver is used to access GPIOs over the ARM SCMI protocol.
> +         This driver is used to access GPIOs over the SCMI protocol.
>
>  config GPIO_CADENCE
>         tristate "Cadence GPIO support"
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 2bfbcc033d59..cda0aedb36ca 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -401,7 +401,7 @@ config SENSORS_ARCTIC_FAN_CONTROLLER
>           will be called arctic_fan_controller.
>
>  config SENSORS_ARM_SCMI
> -       tristate "ARM SCMI Sensors"
> +       tristate "SCMI Sensors"
>         depends on ARM_SCMI_PROTOCOL
>         depends on THERMAL || !THERMAL_OF
>         help
> diff --git a/drivers/iio/common/scmi_sensors/Kconfig b/drivers/iio/common=
/scmi_sensors/Kconfig
> index 67e084cbb1ab..5c152d9d30d2 100644
> --- a/drivers/iio/common/scmi_sensors/Kconfig
> +++ b/drivers/iio/common/scmi_sensors/Kconfig
> @@ -12,7 +12,7 @@ config IIO_SCMI
>          select IIO_KFIFO_BUF
>         help
>            Say yes here to build support for IIO SCMI Driver.
> -          This provides ARM SCMI Protocol based IIO device.
> +          This provides SCMI Protocol based IIO device.
>            This driver provides support for accelerometer and gyroscope
>            sensors available on SCMI based platforms.
>  endmenu
> diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scm=
i.c
> index 1bb36ca477b7..e6fb0699c0a2 100644
> --- a/drivers/pinctrl/pinctrl-scmi.c
> +++ b/drivers/pinctrl/pinctrl-scmi.c
> @@ -595,5 +595,5 @@ module_scmi_driver(scmi_pinctrl_driver);
>
>  MODULE_AUTHOR("Oleksii Moisieiev <oleksii_moisieiev@epam.com>");
>  MODULE_AUTHOR("Peng Fan <peng.fan@nxp.com>");
> -MODULE_DESCRIPTION("ARM SCMI pin controller driver");
> +MODULE_DESCRIPTION("SCMI pin controller driver");
>  MODULE_LICENSE("GPL");
> diff --git a/drivers/pmdomain/arm/scmi_perf_domain.c b/drivers/pmdomain/a=
rm/scmi_perf_domain.c
> index 3693423459c9..00bae4e04aaa 100644
> --- a/drivers/pmdomain/arm/scmi_perf_domain.c
> +++ b/drivers/pmdomain/arm/scmi_perf_domain.c
> @@ -184,5 +184,5 @@ static struct scmi_driver scmi_perf_domain_driver =3D=
 {
>  module_scmi_driver(scmi_perf_domain_driver);
>
>  MODULE_AUTHOR("Ulf Hansson <ulf.hansson@linaro.org>");
> -MODULE_DESCRIPTION("ARM SCMI perf domain driver");
> +MODULE_DESCRIPTION("SCMI perf domain driver");
>  MODULE_LICENSE("GPL v2");
> diff --git a/drivers/pmdomain/arm/scmi_pm_domain.c b/drivers/pmdomain/arm=
/scmi_pm_domain.c
> index 3d73aef21d2f..64ac7566d943 100644
> --- a/drivers/pmdomain/arm/scmi_pm_domain.c
> +++ b/drivers/pmdomain/arm/scmi_pm_domain.c
> @@ -168,5 +168,5 @@ static struct scmi_driver scmi_power_domain_driver =
=3D {
>  module_scmi_driver(scmi_power_domain_driver);
>
>  MODULE_AUTHOR("Sudeep Holla <sudeep.holla@arm.com>");
> -MODULE_DESCRIPTION("ARM SCMI power domain driver");
> +MODULE_DESCRIPTION("SCMI power domain driver");
>  MODULE_LICENSE("GPL v2");
> diff --git a/drivers/powercap/Kconfig b/drivers/powercap/Kconfig
> index 03c4c796d993..d3eda4a70978 100644
> --- a/drivers/powercap/Kconfig
> +++ b/drivers/powercap/Kconfig
> @@ -61,7 +61,7 @@ config IDLE_INJECT
>           on a per CPU basis.
>
>  config ARM_SCMI_POWERCAP
> -       tristate "ARM SCMI Powercap driver"
> +       tristate "SCMI Powercap driver"
>         depends on ARM_SCMI_PROTOCOL
>         help
>           This enables support for the ARM Powercap based on ARM SCMI
> @@ -71,7 +71,7 @@ config ARM_SCMI_POWERCAP
>           and monitored against the SCMI Powercap domains advertised as
>           available by the SCMI platform firmware.
>
> -         When compiled as module it will be called arm_scmi_powercap.ko.
> +         When compiled as module it will be called scmi_powercap.ko.
>
>  config DTPM
>         bool "Power capping for Dynamic Thermal Power Management (EXPERIM=
ENTAL)"
> diff --git a/drivers/powercap/Makefile b/drivers/powercap/Makefile
> index 5ab0dce565b9..b0d5d1e91d7e 100644
> --- a/drivers/powercap/Makefile
> +++ b/drivers/powercap/Makefile
> @@ -7,4 +7,4 @@ obj-$(CONFIG_INTEL_RAPL_CORE) +=3D intel_rapl_common.o
>  obj-$(CONFIG_INTEL_RAPL) +=3D intel_rapl_msr.o
>  obj-$(CONFIG_INTEL_RAPL_TPMI) +=3D intel_rapl_tpmi.o
>  obj-$(CONFIG_IDLE_INJECT) +=3D idle_inject.o
> -obj-$(CONFIG_ARM_SCMI_POWERCAP) +=3D arm_scmi_powercap.o
> +obj-$(CONFIG_ARM_SCMI_POWERCAP) +=3D scmi_powercap.o
> diff --git a/drivers/powercap/arm_scmi_powercap.c b/drivers/powercap/scmi=
_powercap.c
> similarity index 99%
> rename from drivers/powercap/arm_scmi_powercap.c
> rename to drivers/powercap/scmi_powercap.c
> index ab66e9a3b1e2..24eef8045e80 100644
> --- a/drivers/powercap/arm_scmi_powercap.c
> +++ b/drivers/powercap/scmi_powercap.c
> @@ -546,5 +546,5 @@ static void __exit scmi_powercap_exit(void)
>  module_exit(scmi_powercap_exit);
>
>  MODULE_AUTHOR("Cristian Marussi <cristian.marussi@arm.com>");
> -MODULE_DESCRIPTION("ARM SCMI Powercap driver");
> +MODULE_DESCRIPTION("SCMI Powercap driver");
>  MODULE_LICENSE("GPL");
> diff --git a/drivers/regulator/scmi-regulator.c b/drivers/regulator/scmi-=
regulator.c
> index c005e65ba0ec..ffceaa66e257 100644
> --- a/drivers/regulator/scmi-regulator.c
> +++ b/drivers/regulator/scmi-regulator.c
> @@ -417,5 +417,5 @@ static struct scmi_driver scmi_drv =3D {
>  module_scmi_driver(scmi_drv);
>
>  MODULE_AUTHOR("Cristian Marussi <cristian.marussi@arm.com>");
> -MODULE_DESCRIPTION("ARM SCMI regulator driver");
> +MODULE_DESCRIPTION("SCMI regulator driver");
>  MODULE_LICENSE("GPL v2");
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index d009eb0849a3..f09d2107d158 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -264,7 +264,7 @@ config RESET_RZV2H_USB2PHY
>           (and similar SoCs).
>
>  config RESET_SCMI
> -       tristate "Reset driver controlled via ARM SCMI interface"
> +       tristate "Reset driver controlled via SCMI interface"
>         depends on ARM_SCMI_PROTOCOL || COMPILE_TEST
>         default ARM_SCMI_PROTOCOL
>         help
> diff --git a/drivers/reset/reset-scmi.c b/drivers/reset/reset-scmi.c
> index 4335811e0cfa..a4f95a7fff87 100644
> --- a/drivers/reset/reset-scmi.c
> +++ b/drivers/reset/reset-scmi.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * ARM System Control and Management Interface (ARM SCMI) reset driver
> + * System Control and Management Interface (SCMI) reset driver
>   *
>   * Copyright (C) 2019-2021 ARM Ltd.
>   */
> @@ -128,5 +128,5 @@ static struct scmi_driver scmi_reset_driver =3D {
>  module_scmi_driver(scmi_reset_driver);
>
>  MODULE_AUTHOR("Sudeep Holla <sudeep.holla@arm.com>");
> -MODULE_DESCRIPTION("ARM SCMI reset controller driver");
> +MODULE_DESCRIPTION("SCMI reset controller driver");
>  MODULE_LICENSE("GPL v2");
> ---
> base-commit: 0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
> branch: xnext/scmi
>
> --
> 2.43.0
>

