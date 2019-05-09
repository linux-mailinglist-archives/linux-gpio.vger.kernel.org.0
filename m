Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2ED718F2D
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2019 19:34:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726659AbfEIReh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 May 2019 13:34:37 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:43724 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726657AbfEIReg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 May 2019 13:34:36 -0400
Received: by mail-pl1-f193.google.com with SMTP id n8so1470551plp.10
        for <linux-gpio@vger.kernel.org>; Thu, 09 May 2019 10:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=NV8a2i73WVKMbLkPe/ykYUDMcv3XghE7mWCl/3SVv/k=;
        b=bzNv4L1MDrKiasCNxfbxCkBQ9X3YkMoS0qsgQKS0FtFlKHET55fhcvqLMiusJECl5l
         q/33EuO92lW5akeoBjO9Pim9SjApfPHNf541rTI06X0gZY92PMvN9WsuoigCAeDwBUMc
         XvhUhEPTQGBPY12oVfWmeSo3sl/1Qk9HuwLDh86ABXPBGVhxt1zOfx9MDP3s2thtSgCt
         CB5bE7CMg58hEpmBZ4orboXWEYAp5JFYb5lOtzi3LSbormd5dDzCQT5rrksBbFFmXGLG
         hSmngon424Ew+aAH8fUUGbhVRdYNuJCp5G47qZ2KzRjP0+SN/BUw/uMtcwpA6qssDh2D
         hzzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=NV8a2i73WVKMbLkPe/ykYUDMcv3XghE7mWCl/3SVv/k=;
        b=EM6BfoiYScLXAo1i/27BC1soJoSiXB0j2Q1Aec2RpB7Wwsk7Tt46uDvhpvglTvOmlW
         4bv1q5cfqTYMQ4fXH0kyqeiSxKLANWwsSQFNos1HjsMfU5tY5mfqJdm9Hc8BXmtrvvSm
         qD+E6I9oObIg0B9IegpRpf8rOH7hHe7ZNwr/KqKfJU24SMgLb72VOuf4sA1ovo8fc9yi
         tiiFiWYoa4jwJ/EyrRmaNkZMPDyU0AUukQYKnkrRXykHfPQI6jG260K/lYt+fRboi5KE
         XSwm0KMWubTzNDTiaog1kIlEmTtZ7SB4zIkMiDJYBU8u+sc0lICC9eZbGRlWjzVspB1Y
         cL/w==
X-Gm-Message-State: APjAAAVzjNaXXNK1NlCl7H/74zi6ZDXieK/n57qE+GFe9EDZdSACvQwV
        X4Pmab5L7GFJq/SNo/ay7unbg8zRqYrgJQ==
X-Google-Smtp-Source: APXvYqwGtwtzv7H/zs+qkb/WvwOd0PUv3OZLcslB9uxXJvZ5w1rSJfUucWQhGKXD0BdWBBMGExYOmg==
X-Received: by 2002:a17:902:424:: with SMTP id 33mr6829930ple.102.1557423276297;
        Thu, 09 May 2019 10:34:36 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:7849:6889:3e03:e97c])
        by smtp.googlemail.com with ESMTPSA id 25sm3909134pfo.145.2019.05.09.10.34.34
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 May 2019 10:34:35 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Guillaume La Roque <glaroque@baylibre.com>,
        linus.walleij@linaro.org
Cc:     jbrunet@baylibre.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/6] Add drive-strength in Meson pinctrl driver
In-Reply-To: <20190509162920.7054-1-glaroque@baylibre.com>
References: <20190509162920.7054-1-glaroque@baylibre.com>
Date:   Thu, 09 May 2019 10:34:34 -0700
Message-ID: <7h36lnh6qd.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Guillaume La Roque <glaroque@baylibre.com> writes:

> The purpose of this patchset is to add drive-strength support in meson pinconf
> driver. This is a new feature that was added on the g12a. It is critical for us
> to support this since many functions are failing with default pad drive-strength.
>
> The value achievable by the SoC are 0.5mA, 2.5mA, 3mA and 4mA and the DT property
> 'drive-strength' is expressed in mA.
> So this patch add another generic property "drive-strength-uA". The change to do so

Looks like you forgot to update the cover letter.

The new property in this series is actually named
"drive-strengh-micromap"

> would be minimal and could be benefit to other platforms later on.
>
> Cheers
> Guillaume
>
> Changes since v3:
> - remove dev_err in meson_get_drive_strength
> - cleanup code

You didn't mention the property rename.

Kevin
