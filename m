Return-Path: <linux-gpio+bounces-24010-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6F8B19E7A
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Aug 2025 11:08:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF894189ACA2
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Aug 2025 09:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13F6424502C;
	Mon,  4 Aug 2025 09:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="PlBHTgSi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DD717D346;
	Mon,  4 Aug 2025 09:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754298497; cv=none; b=NzcrZvRu8zWa84BDlUIZ6aSzzUJxCxPqwHlos9QJpxri65dssXzbuza1CrMqYvRsrPYVqAE7hl5xSrgancRQL4qN+QqCQyMUR6/ClX+y0/SRxEiHpk+BNs011FtYTWYEQVv2H889rkHARaJyQAgr1lRwJe6jdXVLhgRYLFxnqsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754298497; c=relaxed/simple;
	bh=dNCb1GbU+zMwwHGSEs5J88EmPe3I2aoFVC/o3+7U2F0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VpwI6sIm3VrC/wTpD52DuM12A5WwRuCC3AwIv9XXqvEpHmcghZOoNhGXgQAw9koHWUpNwYd23UVWQDWqsYdvqkuWQnLRK0e6cSRP9c0bTJJb9C/71twyM9x3WWhC1JtslLR7+FKPhryVUPhjpMuYgV1MdKdgHn7wM7OVN5Od+5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=PlBHTgSi; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754298493;
	bh=dNCb1GbU+zMwwHGSEs5J88EmPe3I2aoFVC/o3+7U2F0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PlBHTgSi+7JUOYuxMn8femLuLfq3RszCQHshgoXnZkewKPTRWb22SaKzxCGHhf840
	 FQTF+WkJpIePV9vztC7CZg4vYnqlyZRMQG56aEoIjG7KFvVRT+Kj4scAov60j7U5ec
	 Fzz8Ec1QZUc8YC4G13q8/RbRYSKruZQQxe1PirBbachk/U30E0fnliOldzBjunQON/
	 +dvTmo6jULLhF59a8odkYh/Q+tot5DtamutSrYLrrNMH9Bvnh+GB6u9hPnunLJtliO
	 0tmK/DIrbt53tW3dHiFdNBmZ5ChqnnxHdFu1OtU3dZyHCGWHzIoP9IUvu9EYfsEQhh
	 u/iH0Tx98hw7Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9849017E0593;
	Mon,  4 Aug 2025 11:08:11 +0200 (CEST)
Message-ID: <fe135942-3040-4858-b2e4-a8e4507b89e9@collabora.com>
Date: Mon, 4 Aug 2025 11:08:11 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/38] ASoC: dt-bindings: mt8192-afe-pcm: Fix clocks and
 clock-names
To: Krzysztof Kozlowski <krzk@kernel.org>,
 linux-mediatek@lists.infradead.org, robh@kernel.org
Cc: herbert@gondor.apana.org.au, davem@davemloft.net, krzk+dt@kernel.org,
 conor+dt@kernel.org, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, jassisinghbrar@gmail.com,
 mchehab@kernel.org, matthias.bgg@gmail.com, chunfeng.yun@mediatek.com,
 vkoul@kernel.org, kishon@kernel.org, sean.wang@kernel.org,
 linus.walleij@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 andersson@kernel.org, mathieu.poirier@linaro.org, daniel.lezcano@linaro.org,
 tglx@linutronix.de, atenart@kernel.org, jitao.shi@mediatek.com,
 ck.hu@mediatek.com, houlong.wei@mediatek.com,
 kyrie.wu@mediatek.corp-partner.google.com, andy.teng@mediatek.com,
 tinghan.shen@mediatek.com, jiaxin.yu@mediatek.com, shane.chien@mediatek.com,
 olivia.wen@mediatek.com, granquet@baylibre.com, eugen.hristev@linaro.org,
 arnd@arndb.de, sam.shih@mediatek.com, jieyy.yang@mediatek.com,
 frank-w@public-files.de, mwalle@kernel.org, fparent@baylibre.com,
 linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-5-angelogioacchino.delregno@collabora.com>
 <b7c9f6b8-4f29-4e38-9c93-e22cfed7229d@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <b7c9f6b8-4f29-4e38-9c93-e22cfed7229d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 24/07/25 11:12, Krzysztof Kozlowski ha scritto:
> On 24/07/2025 10:38, AngeloGioacchino Del Regno wrote:
>>   
>>     clock-names:
>>       items:
>>         - const: aud_afe_clk
>>         - const: aud_dac_clk
>>         - const: aud_dac_predis_clk
>> +      - const: aud_adc_clk
>> +      - const: aud_adda6_adc_clk
>> +      - const: aud_apll22m_clk
>> +      - const: aud_apll24m_clk
>> +      - const: aud_apll1_tuner_clk
>> +      - const: aud_apll2_tuner_clk
>> +      - const: aud_tdm_clk
>> +      - const: aud_tml_clk
>> +      - const: aud_nle
>> +      - const: aud_dac_hires_clk
>> +      - const: aud_adc_hires_clk
>> +      - const: aud_adc_hires_tml
>> +      - const: aud_adda6_adc_hires_clk
>> +      - const: aud_3rd_dac_clk
>> +      - const: aud_3rd_dac_predis_clk
>> +      - const: aud_3rd_dac_tml
>> +      - const: aud_3rd_dac_hires_clk
>>         - const: aud_infra_clk
>>         - const: aud_infra_26m_clk
> 
> 
> You can only add to the end of lists, not in the middle.
> 

The devicetree follows exactly what I've done here, and if I add to the
end of the list (which was wrong from the beginning), I'd have to reorder
all of the clocks in the devicetree node as well.

I know that I'm not supposed to add those there, but this is not about adding
new clocks, it's about adding ones that were missing in the middle.

> Also, please drop all _clk suffixes and aud/top prefixes. These are
> supposed to be clock inputs, so you name them based on this device. Not
> based on the provider's name.

That breaks everything: the driver uses the _clk suffixes and aud/top prefixes
to get clocks by name - I know that "driver" and "binding" are not two words
that go together in that sense, but *otherwise* we'd need to perform way bigger
changes to get this situation resolved.

Those "way bigger changes" would also add bloat to the kernel as we'd need to
parse clocks with old and new names.

Can we please avoid this on SoCs from years ago, which are only getting maintenance
and no new feat/dev?

Thanks,
Angelo


