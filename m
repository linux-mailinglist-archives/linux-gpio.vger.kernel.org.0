Return-Path: <linux-gpio+bounces-9089-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7548E95D433
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 19:21:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C33C1F2343E
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 17:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71AFA18E043;
	Fri, 23 Aug 2024 17:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TnJ/IDvs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6A641C69;
	Fri, 23 Aug 2024 17:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724433683; cv=none; b=d9AxIIvOevO938aq51rzguryhT2yOicZBWKs2DrmnItHTbDFfL8xXCJDb02Yy4AmrRRbE9JlQEamfDRmfxBIkhk6SzP1D6IqzRZVac/coUC3N6S2zJKk8yXHzxvQ6iZUVc84iHKSOkJoq4XkHAdlPdHA70JycWZDxLeN0nLyX9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724433683; c=relaxed/simple;
	bh=CkO9IvqsG0iFWnRGdPmM5Qwes7ubF2O3wr/bx0vRq20=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pv9GyHJBjq63reUXQET4/50R/CXwCzqx6M+VkPpWWiHA0NrQiQajdv6v1+3gEHEv75fAcFqSyCeFZpTEmX7iUNkL9Blve5mhAl7K8IROVXdD1ZqGKUacVk7xjdRuRcZki+VmBfAq+U/Mq1/vuLTNreTsWmSdTpdl9P87sRM1FhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TnJ/IDvs; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-428243f928cso17941695e9.3;
        Fri, 23 Aug 2024 10:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724433680; x=1725038480; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=93UYZNtsycP6f+B131FhdRCqvOk5pQ/dX6SuPovTZMM=;
        b=TnJ/IDvsye+76dyOH5dqUvRYztYBnBLWDo34RwvirXZXn4+SvloP/AhNPR14jx6qsG
         mVYj4b96JKmSVPjQCNOF0nUutdvDV2HTxLJKryz1fcdLgBbhbt4xFoSOR74wZI/a/Cfp
         MsjJ1MhsVu9lTNNoSyj55Lb18Jv0bojZ5LNP08FZ7F70nBHhJ1IxW4fjJCa6gxKNut67
         cIiFTxqgNnUq39SpTucwMRfhNC2aTLhDFERHqydWClhEyz57m8XadlcDeaAJYzx3mJzB
         4EX2tl3LIxTPEeY11EzibjvwtTxc1sGmIfG4s7Zn0WLM4eMw0JRG2CoI2Q9tR4+4v6iQ
         KrYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724433680; x=1725038480;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=93UYZNtsycP6f+B131FhdRCqvOk5pQ/dX6SuPovTZMM=;
        b=cGwCEogjgxe8rWl8bNQyXqNSbNcOIzr81E8Wf/6tfK9N6hryTR/RKkQz6exFZSF2v/
         iHMmorUqskAbKqw4fTxrmhIvc71RTBP4+0dBMcGwxE2NIFUOEWsKUWvaqOWxflZv6RiF
         tu2YBdrHPpE5//OtF+c2lNUSMR6eBUwKrpa1znwwfP2PPy5OvnMjhx6V00/7akl7FcHQ
         zY6hOC093mcOpkmbpL7ZBnOec9RBpeVonxkJoJq2rlNjx+XP6oVnveUNkrFgas2hpeVK
         UDPXQ3/kCHJUR2ZqDkrQk4YzfkX9ifWjks4jPpeQggXqyvpSJ9PfwUm9TZJ97wjL69TQ
         KOqg==
X-Forwarded-Encrypted: i=1; AJvYcCWY2bhgNXB19KSlEkCKefgPY8Rp4CJVuRvVA2CqGXDpw/x+i/Sis3XPIpzVGxJ4M/TwdcKvou8Mgx9WiA==@vger.kernel.org, AJvYcCX5vTpLYgNSKyo+cAdO+HEOgMROucVyMjO9jJbZS5Mrfr3h/5CQd0/REXINlHphaerGFI5zD1weCCnR@vger.kernel.org
X-Gm-Message-State: AOJu0YxmLlFRc12dlZDJerEP4pAMeM+csGZtBmGtgQB3u7kdWMgXx68o
	rP+8MSpJwq6B94785Y1XPY/W8Oa6dWcEJNveKAlVFg/RXBsr0kiU
X-Google-Smtp-Source: AGHT+IGref40zkb0IUvtDNwA0TYFbk5k0+fa5r9I46BPr609ayqKWhEfTU0CKdcojT+tg6DFwoXrFg==
X-Received: by 2002:a05:600c:1f87:b0:421:7bed:5274 with SMTP id 5b1f17b1804b1-42acc8ddcdcmr25250625e9.10.1724433679578;
        Fri, 23 Aug 2024 10:21:19 -0700 (PDT)
Received: from Ansuel-XPS. (host-87-1-209-141.retail.telecomitalia.it. [87.1.209.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42abee8d1d9sm104140345e9.22.2024.08.23.10.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 10:21:19 -0700 (PDT)
Message-ID: <66c8c50f.050a0220.d7871.f209@mx.google.com>
X-Google-Original-Message-ID: <ZsimBSqlc_NeRhZB@Ansuel-XPS.>
Date: Fri, 23 Aug 2024 17:08:53 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	upstream@airoha.com
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: airoha: Add EN7581 pinctrl
 controller
References: <20240822-en7581-pinctrl-v2-0-ba1559173a7f@kernel.org>
 <20240822-en7581-pinctrl-v2-1-ba1559173a7f@kernel.org>
 <20240822-taste-deceptive-03d0ad56ae2e@spud>
 <aef3188d-5aaf-4f6d-addf-60066065ef9b@genexis.eu>
 <20240823-darkened-cartload-d2621f33eab8@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823-darkened-cartload-d2621f33eab8@spud>

On Fri, Aug 23, 2024 at 05:14:30PM +0100, Conor Dooley wrote:
> On Thu, Aug 22, 2024 at 10:50:52PM +0200, Benjamin Larsson wrote:
> > On 22/08/2024 18:06, Conor Dooley wrote:
> > 
> > 
> > Hi.
> > 
> > > before looking at v1:
> > > I would really like to see an explanation for why this is a correct
> > > model of the hardware as part of the commit message. To me this screams
> > > syscon/MFD and instead of describing this as a child of a syscon and
> > > using regmap to access it you're doing whatever this is...
> > 
> > Can you post a link to a good example dts that uses syscon/MFD ?
> > 
> > It is not only pinctrl, pwm and gpio that are entangled in each other. A
> > good example would help with developing a proper implementation.
> 
> Off the top of my head, no unfortunately. Maybe Rob or Krzk have a good
> example. I would suggest to start by looking at drivers within gpio or
> pinctrl that use syscon_to_regmap() where the argument is sourced from
> either of_node->parent or dev.parent->of_node (which you use depends on
> whether or not you have a child node or not).
> 
> I recently had some questions myself for Rob about child nodes for mfd
> devices and when they were suitable to use:
> https://lore.kernel.org/all/20240815200003.GA2956351-robh@kernel.org/
> 
> Following Rob's line of thought, I'd kinda expect an mfd driver to create
> the devices for gpio and pwm using devm_mfd_add_devices() and the
> pinctrl to have a child node.

Just to not get confused and staring to focus on the wrong kind of
API/too complex solution, I would suggest to check the example from
Lorenzo.

The pinctrl/gpio is an entire separate block and is mapped separately.
What is problematic is that chip SCU is a mix and address are not in
order and is required by many devices. (clock, pinctrl, gpio...)

IMHO a mfd is overkill and wouldn't suite the task. MDF still support a
single big region and in our case we need to map 2 different one (gpio
AND chip SCU) (or for clock SCU and chip SCU)

Similar problem is present in many other place and syscon is just for
the task.

Simple proposed solution is:
- chip SCU entirely mapped and we use syscon
- pinctrl mapped and reference chip SCU by phandle
- pwm a child of pinctrl as it's scrambled in the pinctrl mapped regs

Hope this can clear any confusion.

-- 
	Ansuel

