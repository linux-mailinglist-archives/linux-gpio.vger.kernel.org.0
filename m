Return-Path: <linux-gpio+bounces-32870-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBBSN8Rzr2lPZgIAu9opvQ
	(envelope-from <linux-gpio+bounces-32870-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 02:28:36 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABF9243979
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 02:28:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B0DF930584A5
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 01:28:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07CBE2C08D4;
	Tue, 10 Mar 2026 01:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CBLirpHG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B170E28DB46
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 01:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773106109; cv=none; b=R287isrPZ1IBKvfeOWNw6aMw6l2EaQUJEgLz9/NginQzy2f9JL4XOPm6mFibjGT1MHY6tL2S1qxsZHzW/ZSJ/3UCEZdHxh0+8z2+dWZ3KZhTARrItiea/xDsZ/6DJiIyLryTX2IiTb5pLjjWnNGIcf3utD6LQ0rlm786TVGTsTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773106109; c=relaxed/simple;
	bh=v7gPPYL74WJ89jCW2wz7YDyPkdh/3hKFQA82MrNW43g=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mhWtCl47Qb0UAm2efk4u4gZjXKigb2BNjC2aYtczm7BFvT18jHVWjwKLbGL5ai+V90hhy36HqB0ssYUPNBZE7XxLDEmjNZysFWfJQSGNYHbRgMUK1RdEUSRzCqInAJ1tT7ki1N9ObKQuq0ZYkd6r/yYW0ww9umacOpO8Z2+ggYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CBLirpHG; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8cb40149037so1305718785a.2
        for <linux-gpio@vger.kernel.org>; Mon, 09 Mar 2026 18:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773106108; x=1773710908; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nJmRGOM3tXkUFnl1mES+/42tH0in2Gb2lnZjoNo8x7A=;
        b=CBLirpHGNurlQ03vtsSquFWj8Tq6NxmJgjluG88hH3+BDQvqVnQsxUtBWXqvqg3fBg
         XFXlxrOMUc8mvBbb1jaRN+FsbYr1StKxrkeHyt7o2fK9GR3h5SyHvWatIZ/9jJfwlh77
         6hIh766QdsJypSad0b+n6F4K3/EB1sZN5/7fHyKWVnqSTOkLIKxrPF/b3LiBGd4x2BVG
         dEn8yO1uovx1wnpkXzBhlPVdBlalDXCjfqH3J+9CxYRlCckLuJunzOj9xXVG9ndQjICT
         LkZnUqpA5oM6b5i5ZQKwhKDYucvZJd3qpeT4m5nxPRrhYKsYHt25KFU4jnKmY7grG/Ol
         NzZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773106108; x=1773710908;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nJmRGOM3tXkUFnl1mES+/42tH0in2Gb2lnZjoNo8x7A=;
        b=ixVAArXnsas1onzVZVqYtfZ+6NChAHV6/Nmm04k48igcvtI35qqC6HcDISRXPVQ7kP
         LCOTUsM0m5hChJJEEFPldVfy3XUOwk9vrXKYZY4wI9MKlqzzSeXuMz/IxcjIaM3doECb
         bB9ydU21Q0ZcjDfhfm0c6ibpuaCiARfrlwiD0g7QN77oHkWHAzX6GCaOC+B3hbNfaiVw
         mtsj3j5S1smnhGC+hH9Ko1hPZ1F3rNhhJs6CqhOskFmfe4+SHNIOlb3BOWMTqiqIXDjI
         yB7z/drHXF6n7hcJiyzKX49vqOGZowXrrlzrKr4oQh5v61HwBEwhB0wONiHQ19whb15y
         +RJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWT4CGLCBVnIGHRHueY4iZucFa2JvU+SpdPnAsTd1RRL2BT1gd18Q0gscKm4QkLgIq/FFcnE39fZnmh@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+WuppptcFUGOvcZsfsEj0zbhE512t0Uh2ady31XNVr0BJDkC4
	fgpN5pr7USRwNlxcDTATDkLU9lsfY/gZBg/5cZX9H0JAARrj6Q0jx+vF
X-Gm-Gg: ATEYQzynDV0ZaVt71SgPLQPVaZZGd6rDcMsNNxdl0DKd4eYHHIE2AU0Y2/HCdqNdn2d
	mEB6EUHqbHSu9XQooaw8A3FnuGJrNbTQ1oKxxdJBA8ROGbQtas9+k3a6+sEEBN/PqvnnI0eeWJQ
	Gh7aKt3DEjkVC49UaBAdUr4dEurTnTSTCqvo375lotWwK6+81c3jqe/5NWDCVSzw0ox7Z9Gur9w
	OpvDr3owBK56Zf8rmaGGs8Rs5W0Ij+DTMbNIilngrxL3gqW6g1ffbMirC/0NIMNPLtUQQWP2tHL
	bWhl6kVCHZBlgKi8YQ6HsPdPBaXFM3PW3Zsu8EmlxdcvALTGgOh+gyUNEY06y5rUwZhq7qjAD6p
	Ta1gwXUcYu1f4svYUwUUoXhPCVdDhhd90ryYXxDyRuRHSVGLObSLHgEdqmpQ/rtvILqPyKwk1L6
	KqMVvJfIEeKGuaRG5sNXAN9o9KNylqNZfJhgSatiLmC3trCY6am5BtIMPfLxLB0yUhISNJkmdi1
	kbL0MpfNomGiUo=
X-Received: by 2002:a05:620a:45a8:b0:8cd:92c5:b3e7 with SMTP id af79cd13be357-8cd92c5b810mr293297285a.18.1773106107657;
        Mon, 09 Mar 2026 18:28:27 -0700 (PDT)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd6f53bbbesm757747885a.25.2026.03.09.18.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 18:28:27 -0700 (PDT)
Date: Mon, 9 Mar 2026 21:29:08 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/5] SDM670 LPASS LPI pin controller support
Message-ID: <aa9z5DKgK99mL_58@rdacayan>
References: <20260310012446.32226-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310012446.32226-1-mailingradian@gmail.com>
X-Rspamd-Queue-Id: 8ABF9243979
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32870-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 09:24:41PM -0400, Richard Acayan wrote:
> This adds support for the LPASS LPI pin controller on SDM670, which
> controls some audio pins (e.g. TDM or PDM busses). The ADSP patches are
> not sent yet.
> 
> This series depends on LMh because the LPI devicetree node is next to
> the LMh devicetree node (NOPUSH: link to LMh).

I don't have the email check anymore. Well, here are the dependencies:
- SDM670 Basic SoC thermal zones
  https://lore.kernel.org/r/20260310002037.1863-1-mailingradian@gmail.com
- Support for the Pixel 3a XL with the Tianma panel
  https://lore.kernel.org/r/20260310002606.16413-1-mailingradian@gmail.com

