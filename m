Return-Path: <linux-gpio+bounces-7515-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A4890C91C
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2024 13:23:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C265B26506
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2024 11:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B1ED757F0;
	Tue, 18 Jun 2024 10:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v3Gw0NZX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4A573467
	for <linux-gpio@vger.kernel.org>; Tue, 18 Jun 2024 10:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718705573; cv=none; b=oMdnXxa1G/TTOlDaSXctMfFMb/yEEKtyLPrQk1xe/7avVjh2yfFuQyeT7TaT52Mwri7ca/GmRu25M3pQTcS/lzRKuWG9b6yVmmNvL0DHZ4q1f/Zaxxe8/G4cXmzuMt7A4w9qJOdrp+l4qWBENf5LFwNPiX6zwH+dINas2X+ATsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718705573; c=relaxed/simple;
	bh=6mJGdO91RXcGUUmpTMS5iulnchhEDhRErBL2SBn7y1Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mcfV25UDwbjoBbvupX+GwqjqKwr2q+jHSLSZn8B77G8J7VvNuRSN3pbehjNw62xHtxYKqlAHUoIDsgEBiEUQsoHeF1R/cE8YRclhx6ycjs50hXA0wrWfetQEOE3C+zsHkOportH2IMde7KpvOXXgKFHzCtvVDu2aIW91WGftK7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v3Gw0NZX; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52c8342af5eso5531925e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 18 Jun 2024 03:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718705569; x=1719310369; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6mJGdO91RXcGUUmpTMS5iulnchhEDhRErBL2SBn7y1Y=;
        b=v3Gw0NZXO1jsVwmU74+EYrvst9h0EqYrhmWX5XckwBNSX8bEpBKScxgslTCZj7dG0v
         u1dHJZmM54Jk0gqL14R5aibdDgOj+Sq1dVwI/3DtNB3LgbqoAJnUM8YoHR57FkhrIgAV
         3aeuzBrTav4PW02t7xL9LqU71plj1zZ8kaxnUL0JIbgvckbK7WBWkwmDaH+mD+1Q5rSf
         xAiIIraUqzUuqbp6CutiWzQVHkZgC0WARo3r011HZMsjkduFGO9pVCwE3B74mCedffKH
         pMLq06RiKXPkW7h+Gr6LbY/KKxfMfLW++jhbL/aIv2QyAVyPVxRxeXD7dCz2ABC29Cwu
         ZCtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718705569; x=1719310369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6mJGdO91RXcGUUmpTMS5iulnchhEDhRErBL2SBn7y1Y=;
        b=Om8qlE+7OcQMBhjkPHRyLCgxDQrK9oij3wk0hLE0g/FHvps/X+a0SLw5C51kn+kDSQ
         aR0DyleoPlBUF3GVCE4JLG5Bxi6g69EyThmG55wZSH00KIwskIwGvP8O0KE5YTQDRz9C
         hHDz+OkV+pDgk5Nt9GDNqxaaCVM+g/Bwrsdm5tRcuKUbfflRRncBL/6+8KBLxQrzPaIt
         o5mG9aOUCmV50qL9qifkT5sMrrUC7gnsCxlGVvJYSXozyWYEzyPxp4iijQlVqPqmbDU1
         9ICj0wUvZf7zSFFKNcos0coFCF9E2YgvXPK60XFEspGk+W5E13Z1tUwApMF9c3dsuT9y
         FFkA==
X-Forwarded-Encrypted: i=1; AJvYcCVSSTjYL771aAJDDU/Q3D1gUsYKGOsnNFQQXo+FDx/e/83UGgs9TdzKsDt9bOtm55dJNNLGlLzVRfog2sfCZT9cXSobEjhkpCaxIg==
X-Gm-Message-State: AOJu0YwQE6c+fg8N7yzPVXlOn6mJrtM336mT9UGb19xM8vHQUGs2ILed
	YCR0tE0vvU9sB2Wr9djvNSg9bI9uDRKTPXuoiKe+jsYbcvRYKbP/FrYOBs/liLYf3XFIjOc/zs7
	IjGk3smyo14/W8uzUo1sEArPf2dVfF4PRD8CDRQ==
X-Google-Smtp-Source: AGHT+IEKxSYIL7tUGgByZhiLAFjBAQVY6s4nNE+5nGraekK5gKASUp0MAAKFzLc/2g9E9O4NH5x6/Qwg+Tbi7p1WJE4=
X-Received: by 2002:a05:6512:ad2:b0:52c:9468:c991 with SMTP id
 2adb3069b0e04-52ca6e55dfbmr8037884e87.14.1718705569563; Tue, 18 Jun 2024
 03:12:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240521-pinctrl-scmi-imx95-v1-0-9a1175d735fd@nxp.com>
 <CACRpkdbpL=HUXj0hFAo+JNki_RA9aix2sW1cg13g9=89d93PZw@mail.gmail.com> <AM6PR04MB5941328E3343E5263C87528D88C12@AM6PR04MB5941.eurprd04.prod.outlook.com>
In-Reply-To: <AM6PR04MB5941328E3343E5263C87528D88C12@AM6PR04MB5941.eurprd04.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Jun 2024 12:12:37 +0200
Message-ID: <CACRpkdYprmc2vm8fVHBSYD+LtJavZ1tj7uQyTeVGkSv88RYF=Q@mail.gmail.com>
Subject: Re: [PATCH 0/3] pinctrl: scmi: support i.MX95 OEM extensions with
 fsl,pins property
To: Peng Fan <peng.fan@nxp.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Aisheng Dong <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2024 at 8:30=E2=80=AFAM Peng Fan <peng.fan@nxp.com> wrote:

> Just checked your repo in git.kernel.org, not see the patches.
> No big deal, just wonder if they got forgotten.

I had to figure out some bureaucracy around the git branches, it should
be there now.

Yours,
Linus Walleij

