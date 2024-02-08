Return-Path: <linux-gpio+bounces-3111-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DA384E200
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Feb 2024 14:31:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C7411C219FF
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Feb 2024 13:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54FF7763EF;
	Thu,  8 Feb 2024 13:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S4FdZemn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CD5762F0
	for <linux-gpio@vger.kernel.org>; Thu,  8 Feb 2024 13:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707399092; cv=none; b=bJ8an+Q0ax0LcZPkpmCEAjH3TDUJUekNGbQmZq4cnuOQ+TfS1cwM9MXw/EoyQgn8wEt11kXerk2f7MJHkLwW/SgrmrCXlhIIn1Fx297Yn8SPPa41LFSasmODN2AK/VJ/OiFH0XeXi3y/yhUoap+WA7ysPlQll422w/DP/0vTZcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707399092; c=relaxed/simple;
	bh=C4OvEEEwjXlQdhcROp3m3acnLC0LaYM75E3IJm7BavY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I0S9ZignzEoUIBDOqSHbNbC4L4tr5O8Lb2kffsUagV/hV5utiIrxNWmjCPuiDepNZs9Kbq1arRpaiN8p2fPuhLBaoEQN5It/UJ3baj6FrY+6NRpsqiJdhYJdJkE2Tf8+XEi0Tk2vtSfuW1AsM140DFZjTcOHDcETiBSgIiQOmtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S4FdZemn; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6049b3deee8so15537037b3.1
        for <linux-gpio@vger.kernel.org>; Thu, 08 Feb 2024 05:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707399089; x=1708003889; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C4OvEEEwjXlQdhcROp3m3acnLC0LaYM75E3IJm7BavY=;
        b=S4FdZemnM0WZ/l/jl5wMZmdJJQKVgReuOcB0QNNVtS+IJVv7SqpOOlS/bWkxG3hvjk
         CG+nSxatlZ3Mg/uVHYxDZzfkmE/ENQGJJzo8m2PDeZ7Z0Mo0VgwJ/wYsyjP1fEVPcX3m
         vqKiXcPwun6AXF1QUIfnNXVWDOcSzjyz+Zn+YVaBX/pj9KIKBRQ+PRnLdR4ZfEhaGR+2
         UyFg7QgkcyD6V+yGN5kCMbFoAcLoO6RKtkny0H7Eac8h+Ise9xvYg8+4qnDlmXzMZp5f
         yFV3/y61D8OerhNVfc6ZliFd/Ld0OC6qDaGbKMsj4GHvAnp4nNrcF2MqDfDtSxUDzEZc
         Nhmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707399089; x=1708003889;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C4OvEEEwjXlQdhcROp3m3acnLC0LaYM75E3IJm7BavY=;
        b=aUxPoBFJnhZ9kOsMmtFz+wp5uf+zJ7q2UPfkWOQ9mpoD0eOVCehxwy4MkAYtFFQG60
         fba+yQwwqZNqZqzc7dcQkT1B6o58Hu4zTLst9bnnqalsalvphH/Zm5hFalbW/I7Hg8Wz
         jwxNWzIDQxW9DcPxHqJKufZaW+4erlW42pS13VwdEX4QwIMkBObra2ARQWX6CYOgNpLI
         X0iIUTnV3xWXZtjCJWGYAl1epuzUowfPoygnMJ5+6mt3TsZfenQYoe7DpohG2c1AB5Jg
         ssi3Xeh8VSyg4S9OUf8Qeqbt9KDTxD9VphTRiFmQj1ldN7yWhpp4Kw/neohqWvxepsCM
         FoxQ==
X-Gm-Message-State: AOJu0YwDkXfgcTiweLaNBWdUzhk3ueQkQ63YBUukRB6nsJn9h+SxTbom
	eMqDXff9qjmgm9FlwdpWxbZyT1x4+w1RNDPZ7LhLtDvVvEHud12M9PNvgrwbj+E9kqDbv9Kls8s
	ywJWcRlZPoqSEHMFeYmSbQpblQI7op3yoKmOUtQ==
X-Google-Smtp-Source: AGHT+IH7ejHpSxnYkgSDOz9JbPT7cK19dcHwdUp8da713zRYjS45D7HGSn8vMhrU2FW5og7Y4ZPr4S9V7UiubVyiBWo=
X-Received: by 2002:a0d:cb82:0:b0:604:9e94:7c02 with SMTP id
 n124-20020a0dcb82000000b006049e947c02mr3572225ywd.25.1707399089608; Thu, 08
 Feb 2024 05:31:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240206112501.715042-1-naresh.solanki@9elements.com>
In-Reply-To: <20240206112501.715042-1-naresh.solanki@9elements.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 8 Feb 2024 14:31:18 +0100
Message-ID: <CACRpkdbzv-Q8KouPCkWmc46Eti5fjnuiZUbWcSsKCXReurnnTA@mail.gmail.com>
Subject: Re: [PATCH v4] dt-bindings: pinctrl: cy8c95x0: Update gpio-reserved-ranges
To: Naresh Solanki <naresh.solanki@9elements.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Patrick Rudolph <patrick.rudolph@9elements.com>, mazziesaccount@gmail.com, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 6, 2024 at 12:25=E2=80=AFPM Naresh Solanki
<naresh.solanki@9elements.com> wrote:

> Update maxItems to 60 for gpio-reserved-ranges to allow multiple gpio
> reserved ranges.
> Add input-enable property to allow configuring a pin as input.
> Also update example.
>
> Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>

Patch applied.

Yours,
Linus Walleij

