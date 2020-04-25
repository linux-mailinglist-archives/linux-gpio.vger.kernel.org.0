Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4771F1B8902
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Apr 2020 21:32:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726239AbgDYTcl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Apr 2020 15:32:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:46112 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726201AbgDYTcl (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 25 Apr 2020 15:32:41 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 07103206D4;
        Sat, 25 Apr 2020 19:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587843161;
        bh=0ulDBW0A0FGxgWHUR/UjwRr2lxLvSlNEMvQY0s82ih0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=k7ONbr0w7Jb+HlBd31qwXsYO3DZIys100UIfn0BRsqGXyNJdXqIwGytt4ayvH5YNL
         BdX6BxjUJOXZqhZN57B4PxtMsiLcEJNV+lPksZGI9YpvPlyIFxUrjpVDu6ovu97qOM
         BDxHH5QYVE2Tz6tc4+6JAkRrw34MKIwDOtoyArDo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200423092431.v3.4.Ifcdc4ecb12742a27862744ee1e8753cb95a38a7f@changeid>
References: <20200423162548.129661-1-dianders@chromium.org> <20200423092431.v3.4.Ifcdc4ecb12742a27862744ee1e8753cb95a38a7f@changeid>
Subject: Re: [PATCH v3 4/6] dt-bindings: drm/bridge: ti-sn65dsi86: Convert to yaml
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     swboyd@chromium.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, jeffrey.l.hugo@gmail.com,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        robdclark@chromium.org, jernej.skrabec@siol.net, jonas@kwiboo.se,
        bjorn.andersson@linaro.org,
        Douglas Anderson <dianders@chromium.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        linux-kernel@vger.kernel.org
To:     Douglas Anderson <dianders@chromium.org>,
        Laurent.pinchart@ideasonboard.com, a.hajda@samsung.com,
        airlied@linux.ie, bgolaszewski@baylibre.com, daniel@ffwll.ch,
        linus.walleij@linaro.org, narmstrong@baylibre.com,
        robh+dt@kernel.org, spanda@codeaurora.org
Date:   Sat, 25 Apr 2020 12:32:40 -0700
Message-ID: <158784316023.117437.12833780288081575852@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Douglas Anderson (2020-04-23 09:25:46)
> This moves the bindings over, based a lot on toshiba,tc358768.yaml.
> Unless there's someone known to be better, I've set the maintainer in
> the yaml as the first person to submit bindings.
>=20
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
