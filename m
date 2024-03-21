Return-Path: <linux-gpio+bounces-4509-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9A9885B21
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Mar 2024 15:47:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2DF5284828
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Mar 2024 14:47:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5008785940;
	Thu, 21 Mar 2024 14:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VSBDnCTF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE9C8528F
	for <linux-gpio@vger.kernel.org>; Thu, 21 Mar 2024 14:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711032422; cv=none; b=HBFR392wumDEDhrdHko3tia0j+ez6KXc/h3y5EKtjSh4ODZp5q7ilWQYyEuwr3OKpiw23FxE8p6OE0CH0wSYNfF6ofbxgjY9eSqbXp3HmRRaWCx26D69/zdjfzpIO8Z+9abZ4KNPjZrSsBpyr1Vor1lbV/M84Esbfr/8+nxTG54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711032422; c=relaxed/simple;
	bh=llYZX8Vl06P5c584RK2OPZBrLHRSgxPJegX38T4GB3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aKedWlOcodinqejlAVAnb4UCkG8p5XQ+TXB/lfC2/QKKejuYxxvg8JGa8NGcjza3uN6sswmTKP28E6WC3XUc99UhV5HbqLPVjnL7Figd3syOzVP050CI1F/yY7DXU2YLFbmJ7SqF5lwlebo4pW31rEhCrT80Asi/K5N+QdeEu1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VSBDnCTF; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-33ecb04e018so638167f8f.1
        for <linux-gpio@vger.kernel.org>; Thu, 21 Mar 2024 07:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711032418; x=1711637218; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GdJRKQkpHq/YxzYas4fiwyUxsBkDgVSnKvrwtVatzEg=;
        b=VSBDnCTF/AkcJVBQiNxmNKQn6lKMYm90FR5hRSt8ak+FHbO5fDNetY1sjFbnJy2ge4
         7jDnoawPwfZ4ZzytLu9PKou2GLxvvgoVJcYL6lTuVvreryl5D6KMuRp9pOsMUowcn1Ad
         gUszo1dgUIJuNtF4RSNJLU5CZMUfFc2xikuIx0FOIn+wdFe9yIoeQiDczvYOY/2mBz83
         BOiNWSp+sVkBRmf+W+uLV1ieFxgTjIZuXpkrrTr3BKCUAiptqX0WUw0XBKgdxFKhb9k+
         YgTWiy1C7VYpBb/fkDh7wad0Fjdlf8DfS5L0uWk/d9qqJIdm/qq5k+4VKEmKBA3RtqZl
         jl9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711032418; x=1711637218;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GdJRKQkpHq/YxzYas4fiwyUxsBkDgVSnKvrwtVatzEg=;
        b=ncdHcWHN9kK+i8diLqv6e1oDU5Ckbo/JrzWqHl5neUgW81j4EPzHr8yHyfN5K7m3bq
         N2w5TSzo5kAjioYc6eUUDsg7ovkjlf2ZHIEV3htkXpJTIojbf/yVupsJof1CbWnCGPrg
         MzdZiSX23HTzvzTX5HDhjl9lgcEv+02bZbv+ZrbnQdU8Bj6jh7mHzf0itZHMyIQw9H2H
         10nWBCaHKKXs20BHQmSE3vbYWdE3YWzzzyrMkGTwTnZZ322pUpDAdsyDwMbeP7DbzrrK
         isOemV1tw95uv5OjPDSdLdQe2nKdXASomZZTagz2i1hR9GYBLpuqym9yVg42c7pcPH8G
         vixg==
X-Forwarded-Encrypted: i=1; AJvYcCUHCV3GNalK9Ypn1+XFG75Hl6/3nXz9GhYbbYvTSYVlsQi0t4wbO0LkryJxkNnf5JMoGw3j8SuC17evNUJ2+795Nbs5AbS8p6L7Eg==
X-Gm-Message-State: AOJu0Yzk6NYefUAq20nVjnx5bfiyWyc+zyW9OzYmgXH9rRLjNlNNNV8/
	L4ybX7iXq6SZtX0tmT8APXgPcXcWGbVEpNsi60LrEterN8JpcppETeEe/XAiCfQ=
X-Google-Smtp-Source: AGHT+IH04y0b0igFcDFoi4qlbIk3SgKxtpe4cx0nnRjzZKbl25rVbNghBibtyOWy/RsfJoVtiUlNEA==
X-Received: by 2002:a5d:4d43:0:b0:33d:7e99:babc with SMTP id a3-20020a5d4d43000000b0033d7e99babcmr1645482wru.50.1711032418202;
        Thu, 21 Mar 2024 07:46:58 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id ba29-20020a0560001c1d00b0033ec8b3b3e4sm14638421wrb.79.2024.03.21.07.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 07:46:57 -0700 (PDT)
Date: Thu, 21 Mar 2024 17:46:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	AKASHI Takahiro <takahiro.akashi@linaro.org>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v5 3/4] firmware: arm_scmi: Add SCMI v3.2 pincontrol
 protocol basic support
Message-ID: <7a4a8287-1f86-4ac4-acdf-c02339ba5e1e@moroto.mountain>
References: <20240314-pinctrl-scmi-v5-0-b19576e557f2@nxp.com>
 <20240314-pinctrl-scmi-v5-3-b19576e557f2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240314-pinctrl-scmi-v5-3-b19576e557f2@nxp.com>

On Thu, Mar 14, 2024 at 09:35:20PM +0800, Peng Fan (OSS) wrote:
> +enum scmi_pinctrl_protocol_cmd {
> +	PINCTRL_ATTRIBUTES = 0x3,
> +	PINCTRL_LIST_ASSOCIATIONS = 0x4,
> +	PINCTRL_CONFIG_GET = 0x5,
> +	PINCTRL_CONFIG_SET = 0x6,
> +	PINCTRL_FUNCTION_SELECT = 0x7,

PINCTRL_FUNCTION_SELECT was removed from the spec so the other cmds were
renumbered.  I'm still going through and reviewing this file.  I'll
hopefully be done tomorrow.

> +	PINCTRL_REQUEST = 0x8,
> +	PINCTRL_RELEASE = 0x9,
> +	PINCTRL_NAME_GET = 0xa,
> +	PINCTRL_SET_PERMISSIONS = 0xb
> +};
> +

[ snip ]

> +static int scmi_pinctrl_attributes(const struct scmi_protocol_handle *ph,
> +				   enum scmi_pinctrl_selector_type type,
> +				   u32 selector, char *name,
> +				   unsigned int *n_elems)
> +{
> +	int ret;
> +	struct scmi_xfer *t;
> +	struct scmi_msg_pinctrl_attributes *tx;
> +	struct scmi_resp_pinctrl_attributes *rx;
> +
> +	if (!name)
> +		return -EINVAL;
> +
> +	ret = scmi_pinctrl_validate_id(ph, selector, type);
> +	if (ret)
> +		return ret;
> +
> +	ret = ph->xops->xfer_get_init(ph, PINCTRL_ATTRIBUTES, sizeof(*tx),
> +				      sizeof(*rx), &t);
> +	if (ret)
> +		return ret;
> +
> +	tx = t->tx.buf;
> +	rx = t->rx.buf;
> +	tx->identifier = cpu_to_le32(selector);
> +	tx->flags = cpu_to_le32(type);
> +
> +	ret = ph->xops->do_xfer(ph, t);
> +	if (!ret) {
> +		if (n_elems)
> +			*n_elems = NUM_ELEMS(rx->attributes);
> +
> +		strscpy(name, rx->name, SCMI_SHORT_NAME_MAX_SIZE);
> +	}
> +
> +	ph->xops->xfer_put(ph, t);
> +
> +	/*
> +	 * If supported overwrite short name with the extended one;
> +	 * on error just carry on and use already provided short name.
> +	 */
> +	if (!ret && EXT_NAME_FLAG(rx->attributes))
                                  ^^^^
Dereferencing "rx" after the ph->xops->xfer_put() is a use after free
(racy).

> +		ph->hops->extended_name_get(ph, PINCTRL_NAME_GET, selector,
> +					    (u32 *)&type, name,
> +					    SCMI_MAX_STR_SIZE);
> +	return ret;
> +}

[ snip ]

> +static int scmi_pinctrl_request(const struct scmi_protocol_handle *ph,
> +				u32 identifier,
> +				enum scmi_pinctrl_selector_type type)
> +{
> +	int ret;
> +	struct scmi_xfer *t;
> +	struct scmi_msg_request *tx;
> +
> +	if (type == FUNCTION_TYPE)
> +		return -EINVAL;
> +
> +	ret = scmi_pinctrl_validate_id(ph, identifier, type);
> +	if (ret)
> +		return ret;
> +
> +	ret = ph->xops->xfer_get_init(ph, PINCTRL_REQUEST, sizeof(*tx), 0, &t);

Missing error check.

	if (ret)
		return ret;

> +
> +	tx = t->tx.buf;
> +	tx->identifier = cpu_to_le32(identifier);
> +	tx->flags = cpu_to_le32(type);
> +
> +	ret = ph->xops->do_xfer(ph, t);
> +	ph->xops->xfer_put(ph, t);
> +
> +	return ret;
> +}
> +
> +static int scmi_pinctrl_pin_request(const struct scmi_protocol_handle *ph,
> +				    u32 pin)
> +{
> +	return scmi_pinctrl_request(ph, pin, PIN_TYPE);
> +}
> +
> +static int scmi_pinctrl_free(const struct scmi_protocol_handle *ph,
> +			     u32 identifier,
> +			     enum scmi_pinctrl_selector_type type)
> +{
> +	int ret;
> +	struct scmi_xfer *t;
> +	struct scmi_msg_request *tx;
> +
> +	if (type == FUNCTION_TYPE)
> +		return -EINVAL;
> +
> +	ret = scmi_pinctrl_validate_id(ph, identifier, type);
> +	if (ret)
> +		return ret;
> +
> +	ret = ph->xops->xfer_get_init(ph, PINCTRL_RELEASE, sizeof(*tx), 0, &t);

	if (ret)
		return ret;

> +
> +	tx = t->tx.buf;
> +	tx->identifier = cpu_to_le32(identifier);
> +	tx->flags = cpu_to_le32(type);
> +
> +	ret = ph->xops->do_xfer(ph, t);
> +	ph->xops->xfer_put(ph, t);
> +
> +	return ret;
> +}

[ snip ]

> +enum scmi_pinctrl_conf_type {
> +	SCMI_PIN_NONE = 0x0,

This is SCMI_PIN_DEFAULT now.

> +	SCMI_PIN_BIAS_BUS_HOLD = 0x1,
> +	SCMI_PIN_BIAS_DISABLE = 0x2,
> +	SCMI_PIN_BIAS_HIGH_IMPEDANCE = 0x3,
> +	SCMI_PIN_BIAS_PULL_UP = 0x4,
> +	SCMI_PIN_BIAS_PULL_DEFAULT = 0x5,
> +	SCMI_PIN_BIAS_PULL_DOWN = 0x6,
> +	SCMI_PIN_DRIVE_OPEN_DRAIN = 0x7,
> +	SCMI_PIN_DRIVE_OPEN_SOURCE = 0x8,
> +	SCMI_PIN_DRIVE_PUSH_PULL = 0x9,
> +	SCMI_PIN_DRIVE_STRENGTH = 0xA,
> +	SCMI_PIN_INPUT_DEBOUNCE = 0xB,
> +	SCMI_PIN_INPUT_MODE = 0xC,
> +	SCMI_PIN_PULL_MODE = 0xD,
> +	SCMI_PIN_INPUT_VALUE = 0xE,
> +	SCMI_PIN_INPUT_SCHMITT = 0xF,
> +	SCMI_PIN_LOW_POWER_MODE = 0x10,
> +	SCMI_PIN_OUTPUT_MODE = 0x11,
> +	SCMI_PIN_OUTPUT_VALUE = 0x12,
> +	SCMI_PIN_POWER_SOURCE = 0x13,
> +	SCMI_PIN_SLEW_RATE = 0x20,
                             ^^^^
This is a decimal vs hex bug.  It should 0x14.  I think this enum would
be more readable in decimal anyway.

> +	SCMI_PIN_OEM_START = 0xC0,
> +	SCMI_PIN_OEM_END = 0xFF,
> +};

But I'm still trying to review the code so I'll probably respond more
tomorrow.

regards,
dan carpenter


