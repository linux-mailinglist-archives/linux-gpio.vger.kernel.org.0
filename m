Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB28D1CE057
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2020 18:25:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730036AbgEKQZS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 May 2020 12:25:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:35634 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729463AbgEKQZQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 11 May 2020 12:25:16 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3B596206DB;
        Mon, 11 May 2020 16:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589214316;
        bh=xIKZxsii59TERc8u9Ja5JM9lNh8Zm7ijJXOL5SBk/EQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Q7KKE3D8YeYjrMAGQ6lQxxXV3AKsoVcRCI9FCm+G7GpA1I0BpKkhOPwQ/kLYpu+90
         N7ONH5eqfOVQ6ppsN1He5JC55Cmo3Os40bB25jx4VJDZclJaW0lGqh44EkqGXyj54+
         3RXp4Op7mgD3XmeHIOv2N+YQAA05FMfA8jh0HwwI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200507143354.v5.4.Ifcdc4ecb12742a27862744ee1e8753cb95a38a7f@changeid>
References: <20200507213500.241695-1-dianders@chromium.org> <20200507143354.v5.4.Ifcdc4ecb12742a27862744ee1e8753cb95a38a7f@changeid>
Subject: Re: [PATCH v5 4/6] dt-bindings: drm/bridge: ti-sn65dsi86: Convert to yaml
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     jonas@kwiboo.se, jeffrey.l.hugo@gmail.com,
        linux-gpio@vger.kernel.org, bjorn.andersson@linaro.org,
        swboyd@chromium.org, jernej.skrabec@siol.net,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, robdclark@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        linux-kernel@vger.kernel.org
To:     Douglas Anderson <dianders@chromium.org>,
        Laurent.pinchart@ideasonboard.com, a.hajda@samsung.com,
        airlied@linux.ie, bgolaszewski@baylibre.com, daniel@ffwll.ch,
        linus.walleij@linaro.org, narmstrong@baylibre.com,
        robh+dt@kernel.org, spanda@codeaurora.org
Date:   Mon, 11 May 2020 09:25:15 -0700
Message-ID: <158921431548.26370.12664787355701762391@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Douglas Anderson (2020-05-07 14:34:58)
> This moves the bindings over, based a lot on toshiba,tc358768.yaml.
> Unless there's someone known to be better, I've set the maintainer in
> the yaml as the first person to submit bindings.
>=20
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
