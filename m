Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3205F20269E
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jun 2020 23:08:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728909AbgFTVH7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 20 Jun 2020 17:07:59 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:34841 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728874AbgFTVH6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 20 Jun 2020 17:07:58 -0400
Received: by mail-lj1-f193.google.com with SMTP id q19so15301445lji.2
        for <linux-gpio@vger.kernel.org>; Sat, 20 Jun 2020 14:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EVO4PW7RZ5BkQYoJgxP0Hx8bG7QWB5MT25IV3wH9AkM=;
        b=Dp0qEIC3xllmaPI+qPS5JRYOt7p/apOAtBOyLTt1Eo2YxFQMjJ2jEQhVFIbnoEOSaj
         NpB6w3MtDNzoDH0i4Lr++i8UwMgUoUFXwnZ2E59aKaaSP08WnuMNS9jC9RzRaVICDgzs
         SD5kRCXwRnMxFkvqWluqoSxPHgFvSUTR8YLxsxV6WYAsUQXojk1Oeb3bTknFsNHxFuOy
         QphZJF78NpRAJS8CIvakBPdC3TQSQlS3lbli4gopKVVfyN1jH0RjSlgBM9Mb2j1lrE+g
         HhCvb+tP7tJpRFBLmyvSv7C76RsBv59CSQjTgluWOwInYb6vvUfG9hdzcYFenNZyN8Z1
         tqIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EVO4PW7RZ5BkQYoJgxP0Hx8bG7QWB5MT25IV3wH9AkM=;
        b=jDfW3EStNIJyf5GLxQJIGeGUw8XUD/zprXjpReTK7UCgank8GMZvi0Vzp+Rbo+Tmgu
         xqwzNlok67Y0noXl6LF+lMdx5UfBaekkKLJCGgnr587LL3gP2A/7aKyaj8Y59CGACTUj
         hk/DgVCGZu+XdU5/x1KLnY8ToTk1g3ud5KSqCJ/3O/4FloNKTre7sS3nJpERK7ceoP+n
         lBIhnUWgf8yPSb7kn4Ty5gzW+0dP/wqYa58kfdy3P3dZ5oBo+Wx/2KBL4ZyVMOXlN9eS
         bgbfEMrp6gIeIKAgYU7OJVl+WlhQLyOsqb+1FiF5c6F6brJookEEBe5PmVWrnjhQC4LB
         bZfw==
X-Gm-Message-State: AOAM530rmb1y3bvZ+s1Ej+qONqZ3Sp7SZ+h7YgDUDOytX/G+8mqTX3U1
        HpAOzeERjHqfr0SFgXb8QBqFJp9KpWPN7J+RvN2qWCga7yk=
X-Google-Smtp-Source: ABdhPJwE4EHbLLjrPuV5spgZm/Iq14+xmGwaVeLjLtulYH7lt3F+0nrvpcg5T7zJTtXYbcSJEj3/EuUpVbHXVXBXMSo=
X-Received: by 2002:a2e:350a:: with SMTP id z10mr4720370ljz.104.1592687214811;
 Sat, 20 Jun 2020 14:06:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200615125407.27632-1-alexandre.torgue@st.com>
In-Reply-To: <20200615125407.27632-1-alexandre.torgue@st.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 20 Jun 2020 23:06:43 +0200
Message-ID: <CACRpkda6STLBFPLE-YdFCqaqqrpUPkweh4qc_OYcdC03KZspPA@mail.gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: stm32: add changes to better manage
To:     Alexandre Torgue <alexandre.torgue@st.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 15, 2020 at 2:54 PM Alexandre Torgue
<alexandre.torgue@st.com> wrote:

> Clocks and resets for GPIO banks could be defined but not yet ready when
> stm32 pinctrl is probed. This series adds changes to manage probe defer
> when a clock or a reset is not yet registered in the system.

Patches applied.

Yours,
Linus Walleij
