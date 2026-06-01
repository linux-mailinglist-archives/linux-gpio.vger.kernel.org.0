Return-Path: <linux-gpio+bounces-37754-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOF0Kp5JHWo2YgkAu9opvQ
	(envelope-from <linux-gpio+bounces-37754-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 01 Jun 2026 10:58:06 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A794261BEFA
	for <lists+linux-gpio@lfdr.de>; Mon, 01 Jun 2026 10:58:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 88E67305E585
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jun 2026 08:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7055E3655E1;
	Mon,  1 Jun 2026 08:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kZrx4IA1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5E8362152
	for <linux-gpio@vger.kernel.org>; Mon,  1 Jun 2026 08:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780303727; cv=none; b=VfpyoCIf4VkYb+Ekm8SVlfb/qm+6AIHBkIiLjZ4YorxgQCHuSo9RGt6R/FVN6vfNd1r4far0z3HTl7SgPaJcUtyEqbviFg0+GrTeo+AuopoGb+BpThwlFzlk07geBzKTu0EZAs5uxLsfCLuteIZR3+LWn9972Je8BXYirsWbaak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780303727; c=relaxed/simple;
	bh=girrbNIhYiFYww2iWQ8yrcb25u0z/iMyv5OA6IPxiDk=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cCj5zerNVVEED18iBXimwSz/Ar5u9PINaQZRX5vi98nuGCDuTdBRN4Y7tyDcRZj4EO/1EMaUaBgSPsXMerMMQXu1s+50BFF+wWyRBeXsUv9eRGSlZCClIhHjpSf1xSezXVI68qnDbuPYTmFE/ERD11xIPtqeJ+CqCsen23VyoL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kZrx4IA1; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C26701F008A2
	for <linux-gpio@vger.kernel.org>; Mon,  1 Jun 2026 08:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780303722;
	bh=cLigZaKJVqblnxm+Q7w7B1ksXMtpT0SjHcOIy06ixU0=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=kZrx4IA192lx27h6fgvYJu5UbGsN7RLwItfeVW9W2t7YSQfeUsC5Wats9N1b0SPq5
	 KLTvl5udoyO17WbkiZpdMYkIZtEj6VdNP3JAkFO/hKfnEVafgUo9mP+12apx7Qo/c3
	 6nYigYZ22hR0a0k2Rg4ntrDz5VxR7Jy4TokvxklQS0qG42DoTCXWHIHLtuqgFceTSl
	 7+EnxPCSLMtmG9o7aTquR5Kp3Yi+8KasvA43j3R9n38ctsQsIXu3bdPUWGiHfDmmeP
	 CO5Z+PCC0AJFKuysCI/mNZrGfZJNWp8QlcZI1rug0wWmJbu57quZNkbDRuKAWTv9DK
	 KRlMGPTSoPZDw==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aa63628d26so1436282e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 01 Jun 2026 01:48:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8EfR45l5pvG6SifgkhfJwJ8rfHEmqZsrYLkq5AxlgH/Mw1gclCm/IL+QU6jTO2i9SpBPlAhZ0QQ73y@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6nwNJk60tUuLRNaSRJEGfIihz3qYy08V0MconMytjlhToLhea
	YI9qpiSgVMWiGRndFj7NAL0ybgt+GwpV1aQ2cLTRWm2ntRDnblkWLNU7AMG4kJX5yaUQRmZN8BC
	3bYKz14E1m7ygOhP92KDwLdx/GMnOrfzTF+S+g1msMA==
X-Received: by 2002:a05:6512:2242:b0:5aa:6a18:2b84 with SMTP id
 2adb3069b0e04-5aa6a182d02mr1894683e87.7.1780303721120; Mon, 01 Jun 2026
 01:48:41 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 1 Jun 2026 04:48:39 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 1 Jun 2026 04:48:39 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260528-pinctrl-level-shifter-v2-1-3a6a025392bf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528-pinctrl-level-shifter-v2-0-3a6a025392bf@oss.qualcomm.com>
 <20260528-pinctrl-level-shifter-v2-1-3a6a025392bf@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 04:48:39 -0400
X-Gmail-Original-Message-ID: <CAMRc=MegLUYfqDNS6VMSPGiU7ChFMsA-xv=YVRNqW7R2Q=ukQg@mail.gmail.com>
X-Gm-Features: AVHnY4Inlne_6R0FqZJ9907w49O5hF9Q9C33iWKqXezEmfJZnmmSrK2afv0df94
Message-ID: <CAMRc=MegLUYfqDNS6VMSPGiU7ChFMsA-xv=YVRNqW7R2Q=ukQg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] soc: qcom: rpmh: Allow non-child devices to issue
 write commands
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: David Collins <david.collins@oss.qualcomm.com>, 
	Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>, 
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, Maulik Shah <maulik.shah@oss.qualcomm.com>, 
	kernel@oss.qualcomm.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37754-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,mail.gmail.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A794261BEFA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 29 May 2026 03:05:35 +0200, Fenglin Wu
<fenglin.wu@oss.qualcomm.com> said:
> Currently, the RPMH driver only allows child devices of the RPMH
> controller to issue commands, as it assumes dev->parent points to the
> RSC device.
>
> There is a possibility that certain devices which are not children of
> the RPMH controller want to send commands for special control at the
> RPMH side. For example, in PMH0101 PMICs, there are bidirectional
> level shifter (LS) peripherals, and each LS works with a pair of PMIC
> GPIOs. The control of the LS, which is combined with the GPIO
> configuration, is handled by RPMH firmware for sharing the resource
> between different subsystems. From a hardware point of view, the LS
> functionality is tied to a pair of PMIC GPIOs, so its control is more
> suitable to be added in the pinctrl-spmi-gpio driver by adding the
> level-shifter function. However, the pinctrl-spmi-gpio device is a
> child device of the SPMI controller, not the RPMH controller.
>
> This patch extends the RPMH driver to support write commands from any
> device that has a pointer to the RPMH controller device:
>
> 1. Add rpmh_get_ctrlr_dev() to lookup controller via device tree
>    phandle "qcom,rpmh"
> 2. Add new APIs: rpmh_write_async_ctrlr() and rpmh_write_ctrlr()
>    that accept controller device pointer directly
>
> With this change, the pinctrl-spmi-gpio driver is able to issue write
> commands to the RPMH controller by using the controller device pointer,
> and vote for enabling the level-shifter function.
>
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/rpmh.c | 173 +++++++++++++++++++++++++++++++++++++++++++-----
>  include/soc/qcom/rpmh.h |  21 ++++++
>  2 files changed, 179 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
> index ca37da3dc2b1..9dbc42b775d9 100644
> --- a/drivers/soc/qcom/rpmh.c
> +++ b/drivers/soc/qcom/rpmh.c
> @@ -12,6 +12,7 @@
>  #include <linux/lockdep.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
> @@ -76,6 +77,21 @@ static struct rpmh_ctrlr *get_rpmh_ctrlr(const struct device *dev)
>  	return &drv->client;
>  }
>
> +static struct rpmh_ctrlr *get_rpmh_ctrlr_from_dev(const struct device *ctrl_dev)
> +{
> +	struct rsc_drv *drv;
> +
> +	if (!ctrl_dev)
> +		return ERR_PTR(-EINVAL);
> +
> +	drv = dev_get_drvdata(ctrl_dev);
> +
> +	if (!drv)
> +		return ERR_PTR(-ENODEV);
> +
> +	return &drv->client;
> +}
> +
>  void rpmh_tx_done(const struct tcs_request *msg)
>  {
>  	struct rpmh_request *rpm_msg = container_of(msg, struct rpmh_request,
> @@ -156,23 +172,11 @@ static struct cache_req *cache_rpm_request(struct rpmh_ctrlr *ctrlr,
>  	return req;
>  }
>
> -/**
> - * __rpmh_write: Cache and send the RPMH request
> - *
> - * @dev: The device making the request
> - * @state: Active/Sleep request type
> - * @rpm_msg: The data that needs to be sent (cmds).
> - *
> - * Cache the RPMH request and send if the state is ACTIVE_ONLY.
> - * SLEEP/WAKE_ONLY requests are not sent to the controller at
> - * this time. Use rpmh_flush() to send them to the controller.
> - */
> -static int __rpmh_write(const struct device *dev, enum rpmh_state state,
> -			struct rpmh_request *rpm_msg)
> +static int __rpmh_write_direct(struct rpmh_ctrlr *ctrlr, enum rpmh_state state,
> +			       struct rpmh_request *rpm_msg)
>  {
> -	struct rpmh_ctrlr *ctrlr = get_rpmh_ctrlr(dev);
> -	int ret = -EINVAL;
>  	struct cache_req *req;
> +	int ret = -EINVAL;
>  	int i;
>
>  	/* Cache the request in our store and link the payload */
> @@ -193,6 +197,25 @@ static int __rpmh_write(const struct device *dev, enum rpmh_state state,
>  	return ret;
>  }
>
> +/**
> + * __rpmh_write: Cache and send the RPMH request
> + *
> + * @dev: The device making the request
> + * @state: Active/Sleep request type
> + * @rpm_msg: The data that needs to be sent (cmds).
> + *
> + * Cache the RPMH request and send if the state is ACTIVE_ONLY.
> + * SLEEP/WAKE_ONLY requests are not sent to the controller at
> + * this time. Use rpmh_flush() to send them to the controller.
> + */
> +static int __rpmh_write(const struct device *dev, enum rpmh_state state,
> +			struct rpmh_request *rpm_msg)
> +{
> +	struct rpmh_ctrlr *ctrlr = get_rpmh_ctrlr(dev);
> +
> +	return __rpmh_write_direct(ctrlr, state, rpm_msg);
> +}
> +
>  static int __fill_rpmh_msg(struct rpmh_request *req, enum rpmh_state state,
>  		const struct tcs_cmd *cmd, u32 n)
>  {
> @@ -271,6 +294,126 @@ int rpmh_write(const struct device *dev, enum rpmh_state state,
>  }
>  EXPORT_SYMBOL_GPL(rpmh_write);
>
> +static void rpmh_put_device(void *data)
> +{

Can you cast it here to struct device * to make it clear what is being
released?

> +	put_device(data);
> +}
> +
> +/**
> + * rpmh_get_ctrlr_dev: Get RPMH controller device from device tree
> + *
> + * @dev: Device with "qcom,rpmh" phandle property
> + *
> + * Returns: Pointer to RPMH controller device, with a devm action registered
> + * on @dev to release the reference when @dev is unbound.

Then I believe it should be called devm_rpmh_get_ctrlr_dev() with the non-devm
variant not registering the devres action.

> + */
> +struct device *rpmh_get_ctrlr_dev(struct device *dev)
> +{
> +	struct device_node *rpmh_np;
> +	struct platform_device *pdev;
> +	struct device_link *link;
> +	int ret;
> +
> +	rpmh_np = of_parse_phandle(dev->of_node, "qcom,rpmh", 0);
> +	if (!rpmh_np)
> +		return ERR_PTR(-ENODEV);
> +
> +	pdev = of_find_device_by_node(rpmh_np);
> +	of_node_put(rpmh_np);
> +
> +	if (!pdev)
> +		return ERR_PTR(-EPROBE_DEFER);
> +
> +	link = device_link_add(dev, &pdev->dev,
> +			       DL_FLAG_AUTOREMOVE_CONSUMER | DL_FLAG_PM_RUNTIME);

This should already be covered by driver core as there already exists a phandle
link from dev->of_node to rpmh_np.

> +	if (!link) {
> +		put_device(&pdev->dev);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	ret = devm_add_action_or_reset(dev, rpmh_put_device, &pdev->dev);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return &pdev->dev;
> +}
> +EXPORT_SYMBOL_GPL(rpmh_get_ctrlr_dev);
> +
> +/**
> + * rpmh_write_async_ctrlr: Write RPMH commands with the controller device pointer
> + *
> + * @ctrl_dev: The RPMH controller device
> + * @state: Active/sleep set
> + * @cmd: The payload data
> + * @n: The number of elements in payload
> + *
> + * Write a set of RPMH commands, the order of commands is maintained
> + * and will be sent as a single shot.

s/shot/batch/?

> + */
> +int rpmh_write_async_ctrlr(const struct device *ctrl_dev, enum rpmh_state state,
> +			   const struct tcs_cmd *cmd, u32 n)
> +{

The signature of this is the same as that of rpmh_write_async() and the two
functions share a lot of code. Can we not rework rpmh_write_async() to
internally check if it needs to call get_rpmh_ctrlr_from_dev() and avoid
introducing new interfaces?

> +	struct rpmh_request *rpm_msg;
> +	struct rpmh_ctrlr *ctrlr;
> +	int ret;
> +
> +	ctrlr = get_rpmh_ctrlr_from_dev(ctrl_dev);
> +	if (IS_ERR(ctrlr))
> +		return PTR_ERR(ctrlr);
> +
> +	rpm_msg = kzalloc_obj(*rpm_msg, GFP_ATOMIC);
> +	if (!rpm_msg)
> +		return -ENOMEM;
> +	rpm_msg->needs_free = true;
> +
> +	ret = __fill_rpmh_msg(rpm_msg, state, cmd, n);
> +	if (ret) {
> +		kfree(rpm_msg);
> +		return ret;
> +	}
> +
> +	return __rpmh_write_direct(ctrlr, state, rpm_msg);
> +}
> +EXPORT_SYMBOL_GPL(rpmh_write_async_ctrlr);
> +
> +/**
> + * rpmh_write_ctrlr: Write RPMH commands and block until response,
> + * with the controller device pointer
> + *
> + * @ctrlr_dev: The RPMH controller device
> + * @state: Active/sleep set
> + * @cmd: The payload data
> + * @n: The number of elements in @cmd
> + *
> + * May sleep. Do not call from atomic contexts.

Add might_sleep() at the top of the function?

> + */
> +int rpmh_write_ctrlr(const struct device *ctrlr_dev, enum rpmh_state state,
> +		     const struct tcs_cmd *cmd, u32 n)
> +{
> +	DECLARE_COMPLETION_ONSTACK(compl);
> +	/* dev is unused in the synchronous non-batch path; pass NULL */
> +	DEFINE_RPMH_MSG_ONSTACK(NULL, state, &compl, rpm_msg);
> +	struct rpmh_ctrlr *ctrlr;
> +	int ret;
> +
> +	ctrlr = get_rpmh_ctrlr_from_dev(ctrlr_dev);
> +	if (IS_ERR(ctrlr))
> +		return PTR_ERR(ctrlr);
> +
> +	ret = __fill_rpmh_msg(&rpm_msg, state, cmd, n);
> +	if (ret)
> +		return ret;
> +
> +	ret = __rpmh_write_direct(ctrlr, state, &rpm_msg);
> +	if (ret)
> +		return ret;
> +
> +	ret = wait_for_completion_timeout(&compl, RPMH_TIMEOUT_MS);
> +	WARN_ON(!ret);
> +	return (ret > 0) ? 0 : -ETIMEDOUT;
> +}
> +EXPORT_SYMBOL_GPL(rpmh_write_ctrlr);
> +
>  static void cache_batch(struct rpmh_ctrlr *ctrlr, struct batch_cache_req *req)
>  {
>  	unsigned long flags;
> diff --git a/include/soc/qcom/rpmh.h b/include/soc/qcom/rpmh.h
> index bdbee1a97d36..90ddcd7ca2fe 100644
> --- a/include/soc/qcom/rpmh.h
> +++ b/include/soc/qcom/rpmh.h
> @@ -22,6 +22,14 @@ int rpmh_write_batch(const struct device *dev, enum rpmh_state state,
>
>  void rpmh_invalidate(const struct device *dev);
>
> +struct device *rpmh_get_ctrlr_dev(struct device *dev);
> +
> +int rpmh_write_async_ctrlr(const struct device *ctrl_dev, enum rpmh_state state,
> +			   const struct tcs_cmd *cmd, u32 n);
> +
> +int rpmh_write_ctrlr(const struct device *ctrlr_dev, enum rpmh_state state,
> +		     const struct tcs_cmd *cmd, u32 n);
> +
>  #else
>
>  static inline int rpmh_write(const struct device *dev, enum rpmh_state state,
> @@ -42,6 +50,19 @@ static inline void rpmh_invalidate(const struct device *dev)
>  {
>  }
>
> +static inline struct device *rpmh_get_ctrlr_dev(struct device *dev)
> +{ return ERR_PTR(-ENODEV); }
> +
> +static inline int rpmh_write_async_ctrlr(const struct device *ctrl_dev,
> +					  enum rpmh_state state,
> +					  const struct tcs_cmd *cmd, u32 n)
> +{ return -ENODEV; }
> +
> +static inline int rpmh_write_ctrlr(const struct device *ctrlr_dev,
> +				    enum rpmh_state state,
> +				    const struct tcs_cmd *cmd, u32 n)
> +{ return -ENODEV; }
> +
>  #endif /* CONFIG_QCOM_RPMH */
>
>  #endif /* __SOC_QCOM_RPMH_H__ */
>
> --
> 2.43.0
>
>

Bartosz

